# TQ ARM modules Yocto Project build setup

This repo contains setup, configuration and dependencies use to build and test
the meta-tq hardware support layer. All Yocto Project / Open Embedded layers
the build depends on are git submodules

Clone this repo using `git clone --branch=<branch-name> --recurse-submodules <url>`

## License information

This repo contains shell scripts released under the GPLv2, see the file
[COPYING](COPYING)

## Supported branches of meta-tq

- krogoth (not longer maintained)
- morty (not longer maintained)
- pyro (not longer maintained)
- rocko (no i.MX mfgtool support, not longer maintained)
- warrior (dropped i.MX mfgtool support)
- zeus
- rocko-tqma8x (only for TQMa8 platforms, based on NXP BSP, not longer maintained)
- sumo-tqmls1012al (only for TQMLS1012AL platform, based on NXP LSDK, not longer maintained)
- sumo-tqma8x (only for TQMa8 platforms, based on NXP BSP)
- thud-tqma8x (only for TQMa8 platforms, based on NXP BSP, experimental)
- zeus-tqma8x (only for TQMa8 platforms, based on NXP BSP)

**Attention:** use README.md of used branch for exact details.

Branch names correspond to Yocto Project release names. Special branches
supporting a special setup are named `<release-name>-<module>`

When switching branches keep in mind to keep the submodules in sync:

```
git submodule sync
git submodule update --init
```

## Supported boards

See README of TQ Sytems layer (meta-tq) or use `./ls-machines` to list machines
from meta-tq.

## Quick Start Guide

### Setting up an initial build space

To set up an initial build space, clone this repo using 

`git clone --branch=<branch-name> --recurse-submodules <url>`

change to  checked out dir and

`. ./setup-environment <builddir> <config>`

You can override defaults with:

* `export MACHINE=<machine>` (default is first tqma\* MACHINE from meta-tq)
* `export DISTRO=<distro>` (tested is poky, per default systemd and wayland are selected via DISTRO_FEATURES)

before sourcing the script. The script sources ./setup-environment, which uses
the requested configuration in sources/template/conf/bblayers.conf.\<config\> as initial
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

### Return to an existing build space

To return to an existing buildspace go to the checked out dir and

`. ./setup-environment <builddir>`

### Configurations

Under sources/templates several configs are supplied as starting point for own
bblayers.conf

* minimal: usable for all supported machines, only minimal layer dependencies

* imx: usable for all machines with i.MX CPU, supports FSL community BSP via meta-freescale

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
* imx: tq-image-weston (meta-dumpling, wayland image with various multimedia packages)
* ti: tq-image-generic (meta-dumpling, based on poky core-image-minimal)
* ls: tq-image-generic (meta-dumpling, based on poky core-image-minimal)

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
key distribution but a starting point fro own developments.

RootFS created with this setup has for demonstration purpose and ease of
development not root password set.
