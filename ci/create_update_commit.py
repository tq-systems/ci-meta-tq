#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
#
# Copyright (C) 2021-2023 TQ-Systems GmbH <oss@ew.tq-group.com>,
# D-82229 Seefeld, Germany.
# Author: Alexander Stein
#
# brief   utility script to create a commit for updating a submodule

from git import Repo, Submodule
from pathlib import Path
import argparse
import sys

### MIT
### https://stackoverflow.com/a/3041990
def query_yes_no(question, default="yes"):
    """Ask a yes/no question via raw_input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
            It must be "yes" (the default), "no" or None (meaning
            an answer is required of the user).

    The "answer" return value is True for "yes" or False for "no".
    """
    valid = {"yes": True, "y": True, "ye": True, "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == "":
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' " "(or 'y' or 'n').\n")

def create_commit_msg_body(repo: Repo, range: str, format: str, args: str = None) -> str:
    return repo.git.log(args, range, format=format, stdout_as_string=True)

def process_submodule(submodule: Submodule, format: str) -> str:
    upper_repo = submodule.repo
    lower_repo = submodule.module()

    base_sha = submodule.hexsha
    target_sha = lower_repo.head.commit.hexsha

    # Add submodule to index, upper_repo.index.add([submodule]) does not write to actual index file
    upper_repo.git.add(submodule.path)
    diffs = upper_repo.index.diff(upper_repo.head.commit)
    # Only one submodule shall be in the index
    assert len(diffs) == 1
    diff = diffs[0]
    # Ensure this diff is on exactly the changed submodule
    assert diff.a_path == diff.b_path
    assert diff.a_path == submodule.path

    range=f'{diff.b_blob}..{diff.a_blob}'

    # subject
    msg = f"{submodule.name}: update to {target_sha}\n\n"
    msg += create_commit_msg_body(repo=lower_repo, range=range, format=format)
    return msg

def process_git_repository(repo: Repo, pkg: str, range:str, format: str, args) -> str:
    # subject
    sha1 = range.split('..')[1]
    msg = f"{pkg}: update to {sha1}\n\n"
    msg += create_commit_msg_body(repo=repo, range=range, format=format, args=args)
    return msg

def process(args):
    cwd = Path.cwd()
    upper_repo = Repo(str(cwd))
    assert not upper_repo.bare,  f"'{cwd}' does contain a bare repository"

    if args.command == 'submodule':
        # Strip trailing slash to support auto-completed paths from shell
        path = args.path.rstrip('/')

        if upper_repo.is_dirty(working_tree=False, index=True, untracked_files=False):
            print('There are staged files which would be commited as well. Please use a clean index')
            return False

        if not path in upper_repo.submodules:
            raise ValueError(f'{path} is not a submodule')
        submodule = upper_repo.submodule(name=path)
        commit_msg = process_submodule(submodule, format=args.git_log_format)
    elif args.command == 'git':
        # Strip trailing slash to support auto-completed paths from shell
        path = args.path.rstrip('/')
        commit_msg = process_git_repository(Repo(path), args.package, args.range, format=args.git_log_format, args=args.logargs)
    else:
        raise NotImplementedError('Unsupported type for target repository')

    print(commit_msg)
    if not args.dryrun:
        answer = True if args.yes else query_yes_no(f'\nCreate signed-off-by commit?', default='no')
        if answer == False:
            # Ensure all files are unstaged again
            upper_repo.index.reset()
            return True
        upper_repo.git.commit(message=commit_msg, signoff=True)
        print(f'\nCreated commit with SHA1: {upper_repo.commit().hexsha}')
    elif args.command == 'submodule':
        # Ensure all files are unstaged again
        upper_repo.index.reset()
    return True

def main():
    parser = argparse.ArgumentParser(description='Create an update commit including git commit subjects')
    parser.add_argument('-f', '--format',
                        metavar='format',
                        dest='git_log_format',
                        type=str,
                        default=r'%h %s',
                        help='Format string for \'git log --format=\' for changelog history. Default: \'%(default)s\''
                        )
    parser.add_argument('-n', '--dryrun',
                        action='store_const',
                        default=False,
                        const=True,
                        help='Dry-run, do not actually create a commit'
                        )
    parser.add_argument('-y', '--yes',
                        action='store_const',
                        default=False,
                        const=True,
                        help='Disable interactive mode. No confirmation is asked. Intended to be used in scripts'
                        )

    subparsers = parser.add_subparsers(dest='command', required=True, help='usage mode')
    parser_submodule = subparsers.add_parser('submodule', help='git submodule')
    parser_submodule.add_argument('path',
                                  metavar='path',
                                  type=str,
                                  help='''
                                      Path for the target for which an update commit shall be created
                                  ''')

    parser_git = subparsers.add_parser('git', help='regular git repository')
    parser_git.add_argument('path',
                            metavar='path',
                            type=str,
                            help='''
                                Path for the target for which an update commit shall be created
                            ''')
    parser_git.add_argument('--logargs',
                            dest='logargs',
                            type=str,
                            help="Additional arguments to 'git log' command. Default: '%(default)s'",
                            default='--first-parent',
                            )
    parser_git.add_argument('package',
                            type=str,
                            help="package to update, will be part of commit message",
                            )
    parser_git.add_argument('range',
                            type=str,
                            help="git revision range",
                            )

    args = parser.parse_args()
    return 0 if process(args) else 1

if __name__ == '__main__':
	sys.exit(main())
