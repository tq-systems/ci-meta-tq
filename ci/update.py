#!/usr/bin/env python3

import os
import configparser

### PWD = os.popen('pwd').read()
PWD = os.getcwd()
print(PWD)

config = configparser.ConfigParser()
config.readfp(open('.gitmodules'))
sections = config.sections()

index = 0
while index < len(sections):
    section =(sections[index])
    module_path = PWD + "/" + config.get(section, "path")
    module_branch = config.get(section, "branch")
    print(module_path)
    os.chdir(module_path)
    gitresult = os.popen('git fetch origin').read()
    print(gitresult)
    gitresult = os.popen('git branch -D test').read()
    gitresult = os.popen('git checkout -b test').read()
    gitcmd = "git branch -D " + module_branch
    gitresult = os.popen(gitcmd).read()
    print(gitresult)
    gitcmd = "git checkout -b " + module_branch + " origin/" + module_branch
    gitresult = os.popen(gitcmd).read()
    print(gitresult)
    gitresult = os.popen('git branch -D test').read()
    os.chdir(PWD)
    index += 1

index = 0
while index < len(sections):
    section =(sections[index])
    module_path = config.get(section, "path")
    gitcmd = "git diff " + module_path
    print("try " + gitcmd)
    gitresult = os.popen(gitcmd).read()
    if gitresult:
        lines = gitresult.splitlines()
        print(lines)
        commit = lines[-1]
        print(commit)
        commit = commit.replace("+Subproject commit ", "")
        #commit = "123"
        print(commit)
        gitcmd = "git add " + module_path
        print("try " + gitcmd)
        gitresult = os.popen(gitcmd).read()
        print(gitresult)
        gitcmd = "git commit -s -m \"" +  module_path + ": update to " + commit + "\""
        print("try " + gitcmd)
        gitresult = os.popen(gitcmd).read()
        print(gitresult)
    index += 1
