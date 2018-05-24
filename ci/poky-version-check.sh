#!/bin/bash -
#
# File:        poky-version-check.sh
# Copyright (C) 2018 TQ Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: utility script for poky / bitbake version checking
#
# License:     GPLv2
#
###############################################################################
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License
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

	# note: this depends on poky in bblayers.conf
	local THE_VERSION=$(bitbake -e | grep ^DISTRO_VERSION)
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

main $@

