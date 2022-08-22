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

This project supports the following branches of meta-tq:

- krogoth (not longer maintained)
- morty (not longer maintained)
- pyro (not longer maintained)
- rocko (only for RZG2 based machines, no longer maintained for all others)
- rocko-tqma8x (only for TQMa8 platforms, based on NXP BSP, no longer maintained)
- sumo-tqmls1012al (only for TQMLS1012AL platform, based on NXP LSDK, no longer maintained)
- sumo-tqma8x (only for TQMa8 platforms, based on NXP BSP, no longer maintained)
- thud-tqma8x (only for TQMa8 platforms, based on NXP BSP, no longer maintained)
- warrior (no longer maintained)
- zeus (no further development, use hardknott)
- zeus-tqma8 (only for TQMa8 platforms, based on NXP BSP, no longer maintained)
- hardknott
- honister (not tested, only transitional)
- kirkstone (not tested)

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

* `export MACHINE=<machine>` (default is first tqma\* MACHINE from meta-tq)
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
meta layer will be sourced from `setup-environment` to get the bitbake environment

After this step, everything is setup to build an image using bitbake.

### Return to an existing build space

To return to an existing buildspace go to the checked out dir and

`. ./setup-environment <builddir>`

### Configurations

Under sources/templates several configs are supplied as starting point for own
bblayers.conf

| config   | description                                              |
| -------- | -------------------------------------------------------- |
| mainline | for machines not depending on a vendor layer (`mainline`)|
| imx      | for machines with i.MX CPU, uses `meta-freescale`        |
| ti       | machines with TI AM335x / AM57xx CPU, uses `meta-ti`     |
| ls       | machines with NXP Layerscape CPU, uses `meta-freescale`  |

### Reproducible build environment

Devolopment and automated builds are supported by the scripts under ci and
configuration under `./sources/templates`, notably

- sample `bblayer.conf` files
- sample `auto.conf` files and inclusion fragments (see Yocto Project doc for
  `local.conf` and `auto.conf`

### Build all supported machines

To build all supported machines from one of the configs, one can
use the CI helper script:

`ci/build_all <builddir> <configuration>`

Depending on the configuration, following images will be built:

| config   | distro               | image                  | kernel       |
| -------- | -------------------- | ---------------------- | -----------  |
| mainline | spaetzle             | tq-image-small-debug   | linux-tq     |
| mainline | dumpling             | tq-image-generic-debug | linux-tq     |
| mainline | dumpling-wayland     | tq-image-weston-debug  | linux-tq     |
| imx      | spaetzle-nxp         | tq-image-small-debug   | linux-imx-tq |
| imx      | dumpling-wayland-nxp | tq-image-weston-debug  | linux-imx-tq |
| ti       | spaetzle-ti          | tq-image-small-debug   | linux-ti-tq  |
| ti       | dumpling-wayland-ti  | tq-image-weston-debug  | linux-ti-tq  |
| ls       | spaetzle             | tq-image-small-debug   | TBD          |
| ls       | dumpling             | tq-image-generic-debug | TBD          |

The kernel recipes are defined in `meta-tq`, image recipes and distro configs
can be found in `meta-dumpling`.

Images:

| image            | description                                          |
| ---------------- | ---------------------------------------------------- |
| tq-image-small   | small image depending on `MACHINE_FEATURES`          |
| tq-image-generic | basic set of tools depending on `MACHINE_FEATURES`   |
| tq-image-weston  | weston GUI and multimedia support                    |

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
