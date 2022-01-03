#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
# file    commit_meta_layer.py
# note    Copyright 2021, TQ-Systems GmbH, Germany
# @author Alexander Stein <Alexander.Stein@tq-group.com>
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

def create_commit_msg_body(repo: Repo, range: str, format: str) -> str:
    return repo.git.log(range, format=format, stdout_as_string=True)

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

def process(args):
    cwd = Path.cwd()
    upper_repo = Repo(str(cwd))
    assert not upper_repo.bare,  f"'{cwd}' does contain a bare repository"
    if upper_repo.is_dirty(working_tree=False, index=True, untracked_files=False):
        print('There are staged files which would be commited as well. Please use a clean index')
        return False

    # Strip trailing slash to support auto-completed paths from shell
    target_path = args.target_path.rstrip('/')

    # Is target a submodule of current repository?
    if target_path in upper_repo.submodules:
        submodule = upper_repo.submodule(name=target_path)
        commit_msg = process_submodule(submodule, format=args.git_log_format)
    # TODO: Is target a stand-alone repository, e.g. no submodule
    else:
        raise NotImplementedError('Unsupported type for target repository')

    print(commit_msg)
    if not args.dryrun:
        answer = query_yes_no(f'\nCreate signed-off-by commit?', default='no')
        if answer == False:
            # Ensure all files are unstaged again
            upper_repo.index.reset()
            return True
        upper_repo.git.commit(message=commit_msg, signoff=True)
        print(f'\nCreated commit with SHA1: {upper_repo.commit().hexsha}')
    else:
        # Ensure all files are unstaged again
        upper_repo.index.reset()
    return True

def main():
    parser = argparse.ArgumentParser(description='Create a commit for updating a submodule including the commit subjects')
    parser.add_argument('target_path',
                        metavar='target',
                        type=str,
                        help='''
                            Path for the target for which an update commit shall be created
                        ''')
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
    args = parser.parse_args()
    return 0 if process(args) else 1

if __name__ == '__main__':
	sys.exit(main())
