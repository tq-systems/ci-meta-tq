# TQ ARM modules Yocto Project build setup

**Attention:** This branch should only be used for TQMaRZG2x machines. For all
other machines use current yocto versions.

This repo contains setup, configuration and dependencies use to build and test
the meta-tq hardware support layer. All Yocto Project / Open Embedded layers
the build depends on are git submodules

Clone this repo using `git clone --branch=<branch-name> --recurse-submodules <url>`

## License information

This repo contains shell scripts released under the GPLv2, see the file
[COPYING](COPYING)

## Supported branches of meta-tq

current supported branches:
- rocko (currently no i.MX mfgtool support)

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

change to checked out dir and

`. ./setup-environment <builddir> <config>`

You can override defaults with:

* `export MACHINE=<machine>` (default is first tqm\* MACHINE from meta-tq)
* `export DISTRO=<distro>` (tested distros are based on poky and could be found
   in meta-dumpling)

before sourcing the script. This script uses the requested configuration from
`sources/template/conf/bblayers.conf.<config>` as initial template for your
bblayer.conf

Additionally some config variables are injected via `auto.conf.normal` from
`sources/template/conf/`

In case you have a `~/.oe` or `~/.yocto` dir a `site.conf` file from this dir
will be symlinked to the conf dir inside the build directory to allow machine
specific overrides. Good use case for this are things like

* shared download directory: you can provide `$DL_DIR` via ~/.yocto/site.conf.
* shared sstate cache: you can provide `$SSTATE_DIR` via ~/.yocto/site.conf.
* local PREMIRROR

Internally the `oe-init-build-env` script from the used openembedded / poky
meta layer will be sourced from `sertup-environment` to get the bitbake environment

After this step, everything is setup to build an image using bitbake.

### Return to an existing build space

To return to an existing buildspace go to the checked out dir and

`. ./setup-environment <builddir>`

### Configurations

Under sources/templates several configs are supplied as starting point for own
bblayers.conf

| config  | description                                              |
| ------- | -------------------------------------------------------- |
| minimal | can build machines, that not depend on a vendor layer    |
| imx     | for machines with i.MX CPU, uses `meta-freescale`        |
| ti      | machines with TI AM57xx CPU, uses `meta-ti`              |
| rzg2    | usable for all machines with RZ/G2 CPU, uses `meta-rzg2` |


### Reproducible build environment

Devolopment and automated builds are supported by the scripts under ci and
configuration under `./sources/templates`, notably

- sample `bblayer.conf` files
- sample `auto.conf` files and inclusion fragments (see Yocto Project doc for
  `local.conf` and `auto.conf`

### Build all supported machines

**Attention:** This script downloads the proprietary Renesas package from a
TQ-internal location. To use this for your own builds you have to modify the
`${PATH}` variable in the `install_renesas_proprietary_files` function.

To build all supported machines from one of the configs, one can
use the CI helper script:

`ci/build_all <builddir> <configuration>`

depending on the selected config, the following will be built:

| config  | distro                | image                     | kernel                       |
| ------- | --------------------- | ------------------------- | ---------------------------- |
| minimal | poky                  | tq-image-generic          | linux-tq                     |
| imx     | poky                  | fsl-image-multimedia-full | linux-tq_imx                 |
| ti      | poky                  | tq-image-generic          | linux-tqma57xx-ti-staging-rt |
| rzg2    | dumpling-wayland-rzg2 | core-image-hmi            | linux-renesas                |

The kernel recipes are defined in `meta-tq`, image recipes and distro configs
can be found in `meta-dumpling`.

Images:

| image                     | description                                           |
| ------------------------- | ----------------------------------------------------- |
| tq-image-generic          | basic set of tools depending on `MACHINE_FEATURES`    |
| fsl-image-multimedia-full | multimedia support (from meta-freescale-distro)       |
| core-image-bsp            | basic bsp support (from meta-rzg2)                    |
| core-image-weston         | bsp with mmp and graphic support (from meta-rzg2)     |
| core-image-qt             | bsp with mmp, graphic and qt support (from meta-rzg2) |
| core-image-hmi            | bsp with mmp, graphic and hmi demos (from meta-rzg2)  |

### Clean build

To force a clean build of all supported machines and generate archives, do

`ci/build_all <builddir> <config>`

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
