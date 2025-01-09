# TQ-Systems ARM modules example workspace for Yocto Project build setup

[[_TOC_]]

## Foreword

This repo contains setup, configuration and dependencies use to build and test
the meta-tq hardware support layer. All Yocto Project / Open Embedded layers
the build depends on, are included as git submodules, to allow reproducible builds.

Clone this repo using `git clone --branch=<branch-name> --recurse-submodules <url>`

## License information

This repo contains scripts released under the GPLv2, see the file [COPYING](COPYING)

This repo allows you to setup a workspace / buildspace for poky / the Yocto Project
combining several recipe collections (meta layers). When using this repo to build
software, you need to understand and accept all licenses of the software beeing built.
You are responsible to fulfil all obligations by these licenses.

## Supported branches of meta-tq

This project supports the following branches of meta-tq. Unmentioned branches are
not supported.

- dunfell (only for RZG2 based machines, no longer maintained for all others)
- kirkstone (bugfixing only)
- scarthgap (current actively maintained branch)

**Attention:** use README.md of used branch for exact details.

Branch names correspond to Yocto Project release names. Special branches
supporting a special setup are named `<release-name>-<module>`

When switching branches keep in mind to keep the submodules in sync:

```
git submodule sync
git submodule update --init
```

## Supported boards

See README of TQ-Sytems GmbH hardware support layer (`meta-tq/meta-tq`) or
use `./ls-machines` to list machines from meta-tq.

## Quick Start Guide

### Needed Tools / Prerequisites

For compatible environments and tools needed by the Yocto Project / OpenEmbedded
build environment refer to the documentation of Yocto Project / OpenEmbedded.

Scripts for CI and setup of the build environment in this repository additionally
have the following prerequisites:

- Python3
- jq
- bash
- gnu grep

### Configurations

Under sources/template/conf/templates/ci several configs are supplied as starting
point for own bblayers.conf

| config   | description                                                         |
| -------- | ------------------------------------------------------------------- |
| mainline | SoM supported by mainline based kernel, currently i.MX              |
| imx      | SoM with i.MX CPU, depends on `meta-freescale` with vendor recipes  |
| ti       | SoM with TI Sitara, depends on `meta-ti`                            |
| ls       | SoM with NXP Layerscape CPU, depends on `meta-freescale`            |

Use `ci/ls-configs --file` to show available configs.
Use `ci/ls-machines --file --config=<config>` to show all machines supported by a config.

### Setting up an initial build space

To set up an initial build space, clone this repo using 

`git clone --branch=<branch-name> --recurse-submodules <url>`

change to checked out dir and

`. ./setup-environment <builddir> <config>`

You can override defaults with:

* `export MACHINE=<machine>` (default is first MACHINE from meta-tq/meta-tq
   that matches `<config>`)
* `export DISTRO=<distro>` (tested distros are based on poky and could be found
   in `meta-tq/meta-dumpling`)

before sourcing the script. This script uses the requested configuration from
`sources/template/conf/templates/ci/bblayers.conf.<config>` as initial template
for your bblayer.conf

Additionally some config variables are injected via `auto.conf.normal` from
`sources/template/conf/templates/ci/`

In case you have a `~/.oe` or `~/.yocto` dir a `site.conf` file from this dir
will be symlinked to the conf dir inside the build directory to allow machine
specific overrides. Good use case for this are things like

* shared download directory: you can provide `$DL_DIR` via ~/.yocto/site.conf.
* shared sstate cache: you can provide `$SSTATE_DIR` via ~/.yocto/site.conf.
* local PREMIRROR

Internally the `oe-init-build-env` script from the used openembedded / poky
meta layer will be sourced from `setup-environment` to get the bitbake environment

After this step, everything is setup to build an image using bitbake.

### Return to an existing build space

To return to an existing buildspace go to the checked out dir and

`. ./setup-environment <builddir>`

### Reproducible build environment

Devolopment and automated builds are supported by the scripts under ci and
configuration under `./sources/template/conf/templates/ci`, notably

- sample `bblayer.conf` files
- sample `auto.conf` files and inclusion fragments (see Yocto Project doc for
  `local.conf` and `auto.conf`)

### Build all supported machines

To build all supported machines from one of the configs, one can
use the CI helper script:

`ci/build_all <builddir> <configuration>`

Depending on the settings in `build-config.json` different distro definitions will be
used to build images for the machines in the configuration.

The machine configs and kernel recipes are defined in `meta-tq`
hardware support layer. Image recipes and distro configs can be
found in the `meta-dumpling` distro layer. Both layers are part of the
meta-tq repository.

See documentation in `meta-tq` and `meta-dumpling` for available machines, distros
and images. Listing is possible with helper scripts `ci/ls-configs` and `ci/ls-machines`.

### Clean build

To force a clean build of all supported machines and generate archives, do

`ci/build_all <builddir> <config>`

with a new build directory.

### Building package premirror

To help to create a package premirror (to support offline builds),
one can use the CI helper script:

`ci/fill_mirror <builddir> <config>`

One have to define the following stuff in your site.conf:

```
SOURCE_MIRROR_URL ?= "file://<full path>/"
INHERIT += "own-mirrors"

PREMIRRORS_prepend = "\
        git://.*/.* file://full path>/ \n \
        ftp://.*/.* file://full path>/ \n \
        http://.*/.* file://full path>/ \n \
        https://.*/.* file://full path>/ \n \
        "
```

To fill the mirror, the script

- allows to create also tarballs from SCM using `BB_GENERATE_MIRROR_TARBALLS=1`
- forces downloads for uninative packages by `INHERIT_remove = \"uninative\""`
- copies all archives from DL_DIR to the mirror

This way the mirror can be used to do offline builds without downloading anything
with `BB_FETCH_PREMIRRORONLY=1`

## Security

*Attention* This project is focused on board bringup and demonstration for
TQ-Systems starter kits. Since embedded projects have different goals, the
Yocto Project brings lots of features to modify system configuration and setup.
This project is not a turn key distribution but a starting point for own
developments.

*Attention* RootFS created with this setup has for demonstration purpose and
ease of development no root password set and allows passwordless ssh root access.
Please make sure, to remove things like

* `debug-tweaks`
* `empty-root-password`
* `ssh_allow_root_login`

from `IMAGE_FEATURES` and / or `IMAGE_EXTRA_FEATURES` before release. View the
openembedded / Yocto Project and bitbake documentation.
