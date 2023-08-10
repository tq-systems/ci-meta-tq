#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2016-2023 TQ-Systems GmbH <oss@ew.tq-group.com>,
# D-82229 Seefeld, Germany.
# Author: Markus Niebel
#
# Description: A utility script to tag current version and optionally submodules
#
###############################################################################

set -e
set -C # noclobber

# For security reasons, explicitly set the internal field separator
# to newline, space, tab
OLD_IFS="$IFS"
IFS='
 	'

# TRAP SIGNALS
trap 'cleanup' QUIT EXIT

trap 'error_abort $LINENO' ERR

readonly PROGRAM="$(basename "$0")"
VERSION=
VERBOSE=0

# RETURN VALUES/EXIT STATUS CODES
readonly E_BAD_OPTION=254
readonly E_UNKNOWN=255

function cleanup () {
	IFS="${OLD_IFS}"
	return 0
}

function error_abort () {
	cleanup
	echo "error at $1"
}

function usage () {
	echo "
Usage is as follows:
$PROGRAM <--usage|--help|-?>
    Prints this usage output and exits.
$PROGRAM --version <Release Tag> [--last <Last Release Tag>] [--force]
    create release tag and put log beginning from <Last Release Tag>
    in tag comment. If --force is given, only tag will be created without
    log to handle external submodules without <Last Release Tag>

	"
}

function log () {
	if [ $VERBOSE -eq 1 ]; then
		echo $1
	fi
}

function error () {
	echo $1 >&2
}

function do_set_tag() {
	local VERSION="$1"
	local LAST="$2"
	local FORCE="$3"

	if git show-ref --quiet --tags ${LAST} 2>/dev/null; then
		echo "$(pwd): tag with log message"
		git tag -a ${VERSION} -m "${VERSION}" -m "$(git log --date=short --format="%ad %an: %s" ${LAST}..HEAD)"
	else
		if [ "${FORCE}" -ne "0" ]; then
			echo "$(pwd): tag without log message"
			git tag -a ${VERSION} -m "${VERSION}"
		fi
	fi
}

function main () {
	VERSION=
	LAST=
	FORCE=0

	# Process command-line arguments.
	while test $# -gt 0; do
	    case $1 in

		--version )
		    shift
		    VERSION=$1
		    shift
		    ;;

		--last )
		    shift
		    LAST=$1
		    shift
		    ;;

		--force )
		    shift
		    FORCE=1
		    ;;

		--verbose )
		    shift
		    VERBOSE=1
		    ;;

		-? | --usage | --help )
		    usage
		    exit
		    ;;

		-* )
		    error "Unrecognized option: $1"
		    usage
		    exit $E_BAD_OPTION
		    ;;

		* )
		    break
		    ;;
	    esac
	done

	if [ -z ${VERSION} ]; then
		error "missing version"
		usage
		exit $E_BAD_OPTION
	fi

	if [ -z ${LAST} ]; then
		REV=$(echo ${VERSION##*.})
		LAST=${VERSION%.*}.$(printf "%#04d" $(expr ${REV} - 1))
	fi

	MODULES_PATH=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')

	if ! git show-ref --quiet --tags ${LAST} 2>/dev/null; then
		if [ "${FORCE}" -eq "0" ]
		then
			error "${LAST} is not a tag"
			usage
			exit $E_BAD_OPTION
		fi
	fi

	for m in ${MODULES_PATH}; do
		cd ${m} 1>/dev/null
		if ! git show-ref --quiet --tags ${LAST} 2>/dev/null; then
			if [ "${FORCE}" -eq "0" ]; then
				error "${LAST} is not a tag in ${m}"
				usage
				exit $E_BAD_OPTION
			fi
		fi
		cd - 1>/dev/null
	done

	do_set_tag "${VERSION}" "${LAST}" "${FORCE}"

	for m in ${MODULES_PATH}; do
		cd ${m}
		echo "tagging in $(pwd)"
		do_set_tag "${VERSION}" "${LAST}" "${FORCE}"
		cd -
	done

	return 0
}

main "$@"
