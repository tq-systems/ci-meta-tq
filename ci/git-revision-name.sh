#!/bin/bash -
#
# File:        git-revision-name.sh
# Copyright (C) 2014 - 2018 TQ Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: A utility to get a pretty string for
#              current revision of your project.
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
### set -e
set -C # noclobber

# For security reasons, explicitly set the internal field separator
# to newline, space, tab
OLD_IFS="$IFS"
IFS='
 	'

# Internal variables and initializations.
readonly PROGRAM="$(basename "$0")"
readonly VERSION=0.2

 # Create a place to store our work's progress
function main () {
	local IS_GIT_TAG="0"
	local GITHEAD="$(git rev-parse --verify --short HEAD 2>/dev/null)"
	local GITATAG="$(git describe 2>/dev/null)"
	git show-ref --quiet --tags "${GITATAG}" 2>/dev/null
	[ "${?}" -eq "0" ] && IS_GIT_TAG="1"
	local STAMP="git-stamp"
	if [ "${IS_GIT_TAG}" -gt "0" ]; then
		STAMP="${GITATAG}"
	elif [ -n "${GITATAG}" ]; then
		STAMP="$(echo "${GITATAG}" | awk -F- '{ OFS = "-"; if (NF > 1) $(NF-1) = sprintf("%05d", $(NF-1)); print $0 }')"
	else
		STAMP="git-g${GITHEAD}"
	fi
	echo "${STAMP}"
}

main "$@"
