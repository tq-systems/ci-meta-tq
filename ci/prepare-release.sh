#!/bin/bash
#
# File:        prepare-release.sh
# Copyright (C) 2016 TQ Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: A utility script to install a PTXdist version
#
# License:     GPLv2
#
###############################################################################
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
###############################################################################

# DEBUGGING
# set -e
set -C # noclobber

VERSION=
VERBOSE=0

# RETURN VALUES/EXIT STATUS CODES
readonly E_BAD_OPTION=254
readonly E_UNKNOWN=255

function usage () {
    echo "Usage is as follows:"
    echo
    echo "$PROGRAM <--usage|--help|-?>"
    echo "    Prints this usage output and exits."
    echo "$PROGRAM --version <Release Tag> [--last <Last Release Tag>] [--force]"
    echo "    create release tag and put log beginning from <Last Release Tag>"
    echo "    in tag comment"
    echo
}

function log () {
    if [ $VERBOSE -eq 1 ]; then
        echo $1
    fi
}

function error () {
    echo $1 >&2
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

	if [ -z ${VERSION} ]
	then
		error "missing version"
		usage
		exit $E_BAD_OPTION
	fi

	if [ -z ${LAST} ]
	then
		REV=$(echo ${VERSION##*.})
		LAST=${VERSION%.*}.$(printf "%#04d" $(expr ${REV} - 1))
	fi

	MODULES_PATH=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')

	git show-ref --quiet --tags ${LAST} 2>/dev/null
	if [ "${?}" -ne "0" ] && [ "${FORCE}" -eq "0" ]
	then
		error "${LAST} is not a tag"
		usage
		exit $E_BAD_OPTION
	fi

	for m in ${MODULES_PATH}; do
		cd ${m}
		git show-ref --quiet --tags ${LAST} 2>/dev/null
		if [ "${?}" -ne "0" ] && [ "${FORCE}" -eq "0" ]
		then
			error "${LAST} is not a tag in ${m}"
			usage
			exit $E_BAD_OPTION
		fi
		cd -
	done

	if [ "${FORCE}" -ne "0" ]; then
		echo "$(pwd): tag without log message"
		git tag -a ${VERSION} -m "${VERSION}"
	else
		echo "$(pwd): tag with log message"
		git tag -a ${VERSION} -m "${VERSION}" -m "$(git log --date=short --format="%ad %an: %s" ${LAST}..HEAD)"
	fi

	for m in ${MODULES_PATH}; do
		cd ${m}
		echo "tagging in $(pwd)"
		if [ "${FORCE}" -ne "0" ]; then
			echo "$(pwd): tag without log message"
			git tag -a ${VERSION} -m "${VERSION}"
		else
			echo "$(pwd): tag with log message"
			git tag -a ${VERSION} -m "${VERSION}" -m "$(git log --date=short --format="%ad %an: %s" ${LAST}..HEAD)"
		fi
		cd -
	done

	return 0
}

main $@
