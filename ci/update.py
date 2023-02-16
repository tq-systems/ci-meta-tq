#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0-or-later
#
# File:        update-modules.py
# Copyright (C) 2019 TQ-Systems GmbH
# @author Markus Niebel <Markus.Niebel@tq-group.com>
#
# Description: utility script to update all submodules to HEAD of branch given
#              in .gitmodules
#
###############################################################################


import sys
import os
import errno
import configparser

def main(argv):
	PWD = os.getcwd()
	do_abort = bool(0)
	# print(PWD)

	config = configparser.ConfigParser()
	config.readfp(open('.gitmodules'))
	sections = config.sections()

	index = 0
	while index < len(sections):
		section =(sections[index])
		module_path = PWD + "/" + config.get(section, "path")
		# print(module_path)
		os.chdir(module_path)
		gitresult = os.popen('git status --porcelain').read()
		if gitresult:
			print(module_path + ": not clean, aborting ...")
			do_abort = bool(1)
			break
		# print(gitresult)
		os.chdir(PWD)
		index += 1

	if do_abort:
		exit(errno.ENODATA)

	index = 0
	while index < len(sections):
		section =(sections[index])
		module_path = PWD + "/" + config.get(section, "path")
		module_branch = config.get(section, "branch")
		# print(module_path)
		os.chdir(module_path)
		gitresult = os.popen('git fetch origin').read()
		# print(gitresult)
		gitresult = os.popen('git branch -D test').read()
		gitresult = os.popen('git checkout -b test').read()
		gitcmd = "git branch -D " + module_branch
		gitresult = os.popen(gitcmd).read()
		# print(gitresult)
		gitcmd = "git checkout -b " + module_branch + " origin/" + module_branch
		gitresult = os.popen(gitcmd).read()
		# print(gitresult)
		gitresult = os.popen('git branch -D test').read()
		os.chdir(PWD)
		index += 1

	index = 0
	while index < len(sections):
		section =(sections[index])
		module_path = config.get(section, "path")
		gitcmd = "git diff " + module_path
		# print("try " + gitcmd)
		gitresult = os.popen(gitcmd).read()
		if gitresult:
			lines = gitresult.splitlines()
			# print(lines)
			commit = lines[-1]
			# print(commit)
			commit = commit.replace("+Subproject commit ", "")
			#commit = "123"
			# print(commit)
			gitcmd = "git add " + module_path
			# print("try " + gitcmd)
			gitresult = os.popen(gitcmd).read()
			# print(gitresult)
			gitcmd = "git commit -s -m \"" +  module_path + ": update to " + commit + "\""
			# print("try " + gitcmd)
			gitresult = os.popen(gitcmd).read()
			# print(gitresult)
		index += 1

	os.chdir(PWD)

if __name__ == '__main__':
	main(sys.argv[1:])
