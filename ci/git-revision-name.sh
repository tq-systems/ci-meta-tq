#!/bin/bash -
#
# File:        git-archive-all.sh
# Copyright (C) 2014 - 2018 TQ Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: A utility script that builds an archive file(s) of all
#              git repositories and submodules in the current path.
#              Useful for creating a single tarfile of a git super-
#              project that contains other submodules.
#
# Examples:    Use git-archive-all.sh to create archive distributions
#              from git repositories. To use, simply do:
#
#                  cd $GIT_DIR; git-archive-all.sh
#
#              where $GIT_DIR is the root of your git superproject.
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
OLD_IFS=$IFS
IFS='
 	'

# Internal variables and initializations.
readonly PROGRAM=$(basename "$0")
readonly VERSION=0.1

 # Create a place to store our work's progress
function main () {
	local IS_GIT_TAG="0"
	local GITHEAD=$(git rev-parse --verify --short HEAD 2>/dev/null)
	local GITATAG="$(git describe 2>/dev/null)"
	git show-ref --quiet --tags ${GITATAG} 2>/dev/null
	[ "${?}" -eq "0" ] && IS_GIT_TAG="1"
	local STAMP="git-stamp"
	if [ "${IS_GIT_TAG}" -gt "0" ]; then
		STAMP=${GITATAG};
	elif ! [ -z ${GITATAG} ]; then
		STAMP=$(echo "${GITATAG}" | awk -F- '{ for (i = 1; i <= NF - 2; i++) { if ($i == 1) print $i; else printf("-%s", $i) } }')
		STAMP+=$(echo "${GITATAG}" | awk -F- '{ if (NF >= 3) printf("-%05d-%s", $(NF-1),$(NF));}')
	else
		STAMP=git$(printf "%s%s" -g ${GITHEAD})
	fi
	echo ${STAMP}
}

main $@

