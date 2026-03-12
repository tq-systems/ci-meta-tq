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

# TRAP SIGNALS
trap 'cleanup' QUIT EXIT

trap 'error_abort $LINENO' ERR

# list of tq-owned submodules to set tags in
# separated by `\|` for grep
readonly MODULES_EXCLUDE_LIST='/(meta-(openembedded|freescale|ti|arm|qt6|rauc|yocto)|bitbake|openembedded-core)'

readonly PROGRAM="$(basename "$0")"
VERBOSE=0

# RETURN VALUES/EXIT STATUS CODES
readonly E_BAD_OPTION=254
readonly E_UNKNOWN=255

function cleanup () {
	return 0
}

function error_abort () {
	cleanup
	echo "error at $1"
}

function usage () {
	echo "
Usage: $PROGRAM OPTIONS

OPTIONS
  --usage|--help|-?        Prints this usage output and exits.
  --version=<Release Tag>  create release tag
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

	echo "creating tag in $(pwd)"
	git tag -a "${VERSION}" -m "${VERSION}"
}

function main () {
	local VERSION=

	# Process command-line arguments.
	while test $# -gt 0; do
	    case $1 in

		--version=* )
		    VERSION="${1#*=}"
		    shift
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

	if [ -z "${VERSION}" ]; then
		error "missing version"
		usage
		exit $E_BAD_OPTION
	fi

	do_handle_tag "${VERSION}"

	return 0
}

function do_handle_tag() {
	local VERSION="$1"
	local MODULES_PATH=

	MODULES_PATH=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }' | grep -vE "${MODULES_EXCLUDE_LIST}$")

	for m in ./ ${MODULES_PATH}; do
		cd ${m}
		do_set_tag "${VERSION}"
		cd -
	done
}

main "$@"
