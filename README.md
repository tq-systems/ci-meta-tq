# TQ-Systems ARM modules example workspace for Yocto Project build setup

[[_TOC_]]

## Foreword

This repo contains setup, configuration and dependencies use to build and test
the meta-tq hardware support layer. All Yocto Project / Open Embedded layers
the build depends on, are included as git submodules, to allow reproducible builds.

Clone this repo using `git clone --branch=<branch-name> --recurse-submodules <url>`

**Note:** This branch is not maintained. Use one of the 
[supported branches](#supported-branches-of-meta-tq) of this project.

## License information

This repo contains scripts released under the GPLv2, see the file [COPYING](COPYING)

This repo allows you to setup a workspace / buildspace for poky / the Yocto Project
combining several recipe collections (meta layers). When using this repo to build
software, you need to understand and accept all licenses of the software beeing built.
You are responsible to fulfil all obligations by these licenses.

## Supported branches of meta-tq

Branch names correspond to Yocto Project code names. Branches with the `-next`
suffix contains newer features and bugfixes prepared for the next release. Usually the last active
LTS branches should be supported

See [yocto releases](https://wiki.yoctoproject.org/wiki/Releases) for the state of support for
different Yocto Project releases.

**Attention:** use README.md of used branch for exact details.

When switching branches keep in mind to keep the submodules in sync:

```
git submodule sync
git submodule update --init
```

## Quick Start Guide

See README.md in the checked out branch.
