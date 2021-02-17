# TQ ARM modules Yocto Project build setup

This repo contains setup, configuration and dependencies use to build and test
the meta-tq hardware support layer. All Yocto Project / Open Embedded layers
the build depends on are git submodules of this repo.

Clone this repo using `git clone --branch=<branch-name> --recurse-submodules <url>`

## License information

This repo contains shell scripts released under the GPLv2, see the file
[COPYING](COPYING)

## Supported branches of meta-tq

Branch names correspond to Yocto Project release names. Special branches
supporting a special setup are named `<release-name>-<module>`

- krogoth (not longer maintained)
- morty (not longer maintained)
- pyro (not longer maintained)
- rocko (no i.MX mfgtool support, not longer maintained)
- warrior (dropped i.MX mfgtool support)
- zeus
- rocko-tqma8x (only for TQMa8 platforms, based on NXP BSP, not longer maintained)
- sumo-tqmls1012al (only for TQMLS1012AL platform, based on NXP LSDK)
- sumo-tqma8x (only for TQMa8 platforms, based on NXP BSP)
- thud-tqma8x (only for TQMa8 platforms, based on NXP BSP, experimental)
- zeus-tqma8x (only for TQMa8 platforms, based on NXP BSP, current development)

**Attention:** use README.md of the used branch for exact details.

When switching branches keep in mind to keep the submodules in sync:

```
git submodule sync
git submodule update --init
```

## Supported boards

See README of TQ Sytems layer (meta-tq) or use `./ls-machines` to list machines
from meta-tq.

**Note:** only TQMa8 boards from meta-tq are supported with this branch.

## Quick Start Guide

### Setting up an initial build space

To set up an initial build space, clone this repo using 

`git clone --branch=<branch-name> --recurse-submodules <url>`

change to checked out dir and

`. ./imx-setup-release.sh -b <builddir>`

You can override defaults with:

* `export MACHINE=<machine>` (default is first tqma8\* MACHINE from meta-tq)
* `export DISTRO=<distro>` (tested is fsl-imx-wayland from meta-imx,
only DISTROS with wayland support from meta-fsl-bsp-release/imx/meta-sdk are
supported with this release)

before sourcing the script. The script sources ./setup-environment, which uses
the imx configuration in sources/template/conf/bblayers.conf.imx as initial
template for your bblayer.conf

Additionally some config variables are injected via auto.conf.normal from
sources/template/conf/

In case you have a ~/.oe or ~/.yocto dir a site.conf file will be symlinked to
the conf dir of the buildir to allow machine specific overrrides. For instance
to use a shared download directory, you can provide `$DL_DIR` via
~/.yocto/site.conf.

Internally the oe-init-build-env script from the used openembedded / poky
meta layer will be sourced to get the bitbake environment

After this step, everything is setup to build an image using bitbake.

**Attention:**: meta-imx needs to overwrite some files in
meta-freescale:

`conf/machines/*` and `conf/machines/include/imx-base.include`

This leads to uncommitted changes in meta-freescale.

**Attention:**: The fetcher code of bitbake in the zeus release has issues
with git submodules and shallow cloning, which can cause build breaks.
Therefore a patch is applied to the poky sources when the setup environment
script is sourced. If you do not use shallow clones, the code in
`setup-environment` can be removed.

### Return to an existing build space

To return to an existing buildspace go to the checked out dir and

`. ./setup-environment <builddir>`

### Configurations

Under sources/templates several configs are supplied as starting point for own
bblayers.conf

* minimal: usable for all supported machines, only minimal layer dependencies
(not tested in this release, not usable for tqma8* MACHINES)

* imx: usable for all machines with i.MX CPU, supports NXP reference BSP
via meta-freessale / meta-imx
(only tested for tqma8* MACHINES in this release)

* ti: usable for all machines with TQ AM57xx CPU, uses meta-ti

### Reproducible build environment

Devolopment and automated builds are supported by the scripts under ci and
configuration under ./sources/templates, notably

- sample bblayer.conf files
- sample auto.conf files and inclusion fragments (see Yocto Project doc for
  local.conf and auto.conf

### Build all supported machines

To build all supported machines in one of the configs, one can
use the CI helper script:

`ci/build-all <builddir> <configuration>`

Depending on the configuration, following images will be built:

* minimal: tq-image-generic (meta-dumpling, based on poky core-image-minimal)
* imx: tq-image-qt5 (meta-dumpling, based on the qt5 demo image defined in
meta-imx/meta-bsp)

**Note:** only imx config is supported for this branch.

### Clean build

To force a clean build of all supported machines and generate archives, do

`ci/build-all <builddir> <config> ci`

### Building package premirror

To help to create a package premirror (to support offline builds),
one can use the CI helper script:

`ci/build-all <builddir> <config> mirror`

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

This project is focused on board bringup and demonstration for TQ Systems starter
kits. Since embedded projects have different goals, the Yocto Project brings lots
of features to modify system configuration and setup. This project is not a turn
key distribution but a starting point for own developments.

RootFS created with this setup has no root password set for demonstration
purpose and ease of development.
