#!/bin/bash -
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2014-2023 TQ-Systems GmbH <oss@ew.tq-group.com>,
# D-82229 Seefeld, Germany.
# Author: Markus Niebel
#
# Description: A utility to get a pretty string for
#              current revision of your project.
#
###############################################################################

# Usage:
# git-revision-name.sh [ PREFERRED-TAG ]

set -e
set -C # noclobber

# TRAP SIGNALS
trap 'error_abort $LINENO' ERR

function error_abort () {
	echo "error at $1"
}

# Internal variables and initializations.
readonly PROGRAM="$(basename "$0")"
readonly VERSION=0.3

 # Create a place to store our work's progress
function main () {
	local PREFERRED_TAG="$1"

	local IS_GIT_TAG="0"
	local GITHEAD="$(git rev-parse --verify HEAD 2>/dev/null)"
	local GITATAG="$(git describe --abbrev=12 2>/dev/null)"
	local PREFERRED_TAG_COMMIT="$(git show-ref --tags -d "${PREFERRED_TAG}" 2>/dev/null | awk 'END { print $1 }')"
	if [ -n "${PREFERRED_TAG_COMMIT}" ] && [ "${PREFERRED_TAG_COMMIT}" = "${GITHEAD}" ]; then
		GITATAG="${PREFERRED_TAG}"
		IS_GIT_TAG="1"
	elif git show-ref --quiet --tags "${GITATAG}" 2>/dev/null; then
		IS_GIT_TAG="1"
	fi
	local STAMP="git-stamp"
	if [ "${IS_GIT_TAG}" -gt "0" ]; then
		STAMP="${GITATAG}"
	elif [ -n "${GITATAG}" ]; then
		STAMP="$(echo "${GITATAG}" | awk -F- '{ OFS = "-"; if (NF > 1) $(NF-1) = sprintf("%05d", $(NF-1)); print $0 }')"
	else
		STAMP="git-g${GITHEAD:0:12}"
	fi

	echo "${STAMP}"
}

main "$@"
