# Changelog

All notable changes to this project will be documented in this file.
Releases are named with thefollowing scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

## Next release

### Added

* meta-tq: initial support for MBa8Mx REV020x
* meta-tq: TQMa8Mx u-boot / kernel improvements

### Removed

* meta-tq: support for MBa8Mx REV010x

## sumo.TQMa8.BSP.SW.0014

### Changed

* ci: improve Jenkinsfile
* meta-tq: doc fixes
* meta-tq: new RAM timing for TQMa8Mx

### Fixed:

* ci: prevent QA errors from buildhistory

## sumo.TQMa8.BSP.SW.0013

### Changed

* doc: improvements
* meta-tq: doc fixes
* ci: better approach to archive source packages
* meta-tq: use imx-atf from 4.14.98_2.2.0
* meta-tq: use u-boot from 4.14.98_2.2.0

### Fixes

* meta-tq: tqma8mx: fix sound support
* meta-tq: tqma8mx: fix spourious system stalls

## sumo.TQMa8.BSP.SW.0012

### Added

* meta-tq: first working version for tqma8qm
* add a .gitattributes file

### Changed

* setup-environment: do not manipulate DISTRO_FEATURES
* meta-tq: port kernel for all TQ MX8 boards to 4.14.98_2.2.0
* ls-machines: move to ci and leave link in root
* meta-dumpling: prepare for imx_4.14.98_2.2.0
* meta-tq: prepare for imx_4.14.98_2.2.0
* Rewrite README
* setup-environment: add special handling for meta-freescale and meta-fsl-bsp-release
* ci/build-all: restrict building only imx8 for gui config
* ci: disable mfgtool config
* ci/build-all: clarify output for non exisiting DL_DIR / SSTATE_DIR
* sources: switch to rel_imx_4.14.98_2.2.0 baseline
* meta-tq: scfw firmware with monitor support
* ci: remove mfgtool config
* ls-machines: make it usable in scripts
* setup-environment: provide automatic defaults for machine and distro

### Fixes

* .gitmodules: switch to use https: url
* fsl-setup-release.sh: fix default machine / distro handling
* ci/build-all: fix args for fsl-setup-release.sh

### Removed

* ci/build-all: remove mfgtool support

## sumo.TQMa8.BSP.SW.0010

### Added

* meta-tq: TQMa8Mx: REV.020x support
* template: add IMAGE_FEATURE default handling

### Changed

* meta-dumpling: updates for README and testutils package group
* meta-tq: consolidate TQMa8Mx support
* README: add further notes for ci/buildall and security
* meta-tq: updates / fixes for TQMa8Xx
* meta-dumpling: updates for weston, busybox and images

## sumo.TQMa8.BSP.SW.0009

### Added

* tqma8xqp: add device trees with etml1010g0dka display

### Changed

* ci/Jenkinsfile: switch to currentBuild.getBuildCauses()

## sumo.TQMa8.BSP.SW.0008

### Added

* meta-tq: additional dt for mba8mx

### Changed

* meta-dumpling: improve image generation for tq-image-generic
* meta-tq: improvements and audio / lvds fixes for TQMa8Mx
* sources/template: factor out ci setting for auto.conf
* sources/template: add conf includes and use the for auto.conf
* setup-environment: prepare usage of includes for buildspace conf files
* meta-tq: updates for CAN support
* ci/buildall: print also submodule url
* ci/buildall: use printf instead of echo for build info file structure

### Fixed

* template: mirror.inc: only inherit own-mirrors if SOURCE_MIRROR_URL is set
* setup-environment: ensure to link default auto.conf

## sumo.TQMa8.BSP.SW.0007

### Added

* meta-dumpling: new packagegroup for audio
* meta-tq: add mba8paxx support
* meta-tq: prepare TQMa8XDS support

### Changed

* ci/build-all: improve build info file in binary archive
* meta-dumpling: improve packagegroup-can
* meta-tq: MBpa8Xx improvements and MBa8Xx PCIe fix
* meta-dumpling: updates for busybox config
* README: note changes in meta-freescale when using fsl-bsp-release
* setup scripts: change DEFAULT_MACHINE to tqma8mq-mba8xx
* README: add branch names for TQMa8
* README: update for NXP BSP based setup for TQMa8

### Fixed

* ci/build-all: fix creation of buildinfo file
* meta-tq / meta-dumpling: move dependencies for systemd-machine-units

## Older releases
