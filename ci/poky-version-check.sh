#!/bin/bash -
# SPDX-License-Identifier: GPL-2.0-or-later
#
# File:        poky-version-check.sh
# Copyright (C) 2018 TQ-Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: utility script for poky / bitbake version checking
#
###############################################################################

# DEBUGGING
### set -e
set -C # noclobber

# For security reasons, explicitly set the internal field separator
# to newline, space, tab
OLD_IFS=$IFS
IFS='
 	'

# Internal variables and initializations.
readonly PROGRAM=$(basename "$0")
readonly VERSION=0.1
readonly INFOFILE="version.info"

function usage () {

	echo -e "\nUsage: ${PROGRAM} <help | mkstamp | check> \n \
	help: print this help \n \
	mkstamp: generate ${INFOFILE} in current directory \n \
	check: check bitbake and DISTRO_VERSION against ${INFOFILE}"

}

function do_version_info () {
	rm -f ./${INFOFILE}
	echo -e "BBVERSION: $1\nDISTRO_VERSION: $2" > ./${INFOFILE}
	! [ -f ${INFOFILE} ] && echo "error: creation of ${INFOFILE}" && exit 1
	return 0
}

function do_version_check () {
	! [ -f ${INFOFILE} ] && echo "error: no ${INFOFILE}" && exit 1
	local BBVERSION=$(awk 'NR==1 {print $NF; exit}' ${INFOFILE})
	local DISTRO_VERSION=$(awk 'NR==2 {print $NF; exit}' ${INFOFILE})
	[ "${1}" != "${BBVERSION}" ] && echo "error: bitbake version mismatch" && exit 1
	[ "${2}" != "${DISTRO_VERSION}" ] && echo "error: distro version mismatch" && exit 1
	return 0
}

function main () {

	which bitbake
	! [ $? ] && echo "error: bitbake not found" && exit 1

	# note: this depends on a selected distro
	local THE_VERSION=$(bitbake -e | grep ^"DISTRO_VERSION=")
	export ${THE_VERSION}
	DISTRO_VERSION=${DISTRO_VERSION#\"*}
	DISTRO_VERSION=${DISTRO_VERSION%\"*}

	local BBVERSION=$(bitbake --version | awk '{print $NF}')

	case ${1} in
	"mkinfo" )
		do_version_info ${BBVERSION} ${DISTRO_VERSION}
		exit $?
		;;
	"check" )
		do_version_check ${BBVERSION} ${DISTRO_VERSION}
		exit $?
		;;
	"help" )
		usage
		exit 0
		;;
	* )
		usage
		exit 1
		;;
	esac

}

main "$@"
