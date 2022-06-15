# Changelog

All notable changes to this project will be documented in this file.
Releases are named with the following scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

[[_TOC_]]

## hardknott.TQMLS1028A.BSP.SW.0108

### Fixed

* meta-tq: TQMLS1028A: RCW fixes and new variants
* meta-tq: TQMa6x/TQMa335x: fix build error due to missing config vars for UBI

## hardknott.TQMLS1012AL.BSP.SW.0011

### Added

* meta-tq: tqmls1012al: hardknott release using updated versions:
  * `qoriq-atf_2.4`
  * `u-boot-lsdk-tq-2021.04`
  * `linux-imx-tq_5.15`

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

### Changed

* update external layers to use latest hardknott upstream

### Fixed

* tqmls1012al: PFE hang when running on 100MBit/s ethernet link
* meta-tq: compatibility with meta-freescale upstream for Layerscape based SOM
  (handling of `WKS_FILE` assignment)

## hardknott.TQMLS1028A.BSP.SW.0107

### Changed

* scripts: rewrite setup-environment to reduce complexity and allow usage of
  shells different from bash

### Added

* meta-tq: support for new variant of TQMLS1028A
* meta-tq: generic supporting kernels with PREEMPT-RT
* meta-dumpling: image recipe for PREEMPT-RT testing
* meta-tq: experimental support for Basler MIPI CSI camera for TQMa8MPxL
* submodules: add meta-layers for Basler camera support

### Fixed

* meta-dumpling: workaround to enable building for machines from meta-tq with
  poky-tiny based distros
* meta-freescale: update to get more weak defaults for Layerscape CPU. This fixes
  some assignment mess for machines from meta-tq
* poky: update to 3.3.6, includes several CVE fixes including openssl (CVE 2022-0778)
* meta-freescale: allow overriding the kernel provider more generic

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

## hardknott.TQMa6UL.BSP.SW.0116
## hardknott.TQMa6x.BSP.SW.0220
## hardknott.TQMa7x.BSP.SW.0114

### Added

* meta-dumpling: add debug enabled image recipes
* templates: add support for poky TEMPLATECONF
  * add bblayers.conf and local conf samples
  * add a conf-notes.txt file
* meta-tq: 512 MB variants of TQMa6ULLx and TQMa6ULLxL

### Fixes

* meta-tq: fix dirty pipe vulnerability for linux-tq 5.15 and linux-imx-tq 5.10
* meta-dumpling: use current rng-tools and optimized handling of rngd
* meta-dumpling: rootfs size increase via unused lm_sensors options

### Changed

* ci: build debug enabled images
* templates: add buildhistory and buildstats to ci config
* meta-dumpling: remove buildhistory and buildstats from distros
* setup-environment: use TEMPLATECONF
* meta-dumpling: add more tools to tq images for ease of testing
* ci: exclude TQMa6ULx / TQMa6ULLx / TQMa6ULxL / TQMa6ULLxL / TQMa7x from builds
  with meta-freescale and linux-imx-tq (imx configuration)
* meta-tq: kernel updates for TQMa7x (LTS 5.15.y)
* meta-dumpling: etc/issue[.net] branding

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

## hardknott.TQMa65xx.BSP.SW.0008

### Changed

* update external meta layers to current hardknott head (poky / YP 3.3.5)

### Fixes

* meta-tq: TQMa65xx / TQMa6UL[L]x[L] / TQMa6x: fixes for U-Boot and linux, details
  see CHANGELOG.md in meta-tq

## hardknott.TQMa8.BSP.SW.0084

### Added

* meta-tq: support TQMa8MPxL REV.0200

### Changed

* templates: use meta-oe for minimal config as well
* meta-dumpling: depends on meta-oe directly now

### Fixed

* documentation: update branch support docs

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

## hardknott.TQMa8.BSP.SW.0083

### Added

* meta-tq: inital support for TQMa65xx SOM

### Changed

* meta-tq: support mainline graphic stack without meta-freescale for TQMa6x
* meta-tq: kernel updates for TQMa6ULx/TQMa6ULLx/TQMa6ULxL/TQMa6ULLxL (LTS 5.15.y)
* meta-tq: fixes for TQMLS102xA
* meta-tq: kernel updates for TQMa6x (LTS 5.15.y and linux-imx)
* ci: build time optimization
* yocto: update external layers to latest hardknott head as of 2022/01/14:
  * poky,
  * meta-openembedded,
  * meta-arm
  * meta-freescale

### Fixed

* meta-dumpling: fixes for i.MX based SOM with dumpling distros
* meta-dumpling: fixes for spaetzle distros / tq-image-small

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

## hardknott.TQMa8.BSP.SW.0082

### Added

* ci: new helper script
* meta-tq: add TQMa8MxML 1GB variant (ported from zeus-tqma8 branch)

### Changed

* meta-tq: update TQMa8Xx/TQMa8Xx4/TQMa8XxS to kernel 5.10
* meta-tq: port changes for TQMa335x from zeus branch

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling for this release.

## hardknott.TQMa8.BSP.SW.0081

### Changed

* ci: optimize submodule handling
* meta-tq: documentation updates

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling for this release.

## hardknott.TQMa8.BSP.SW.0080

### Added

* meta-tq: tqma8 / linux-imx-5.10: add experimental support for ath10k wifi
  with USB interface
* meta-dumpling: add qt5 demo image
* meta-dumpling: port camera support from zeus-tqma8 branch
* templates: add meta-qt5 to imx config
* meta-qt5: add layer as submodule
* meta-dumpling: example distros
  * allows building UBI images
  * configuration specific adjustments
* meta-dumpling: image recipes for tiny systems
* meta-tq: support for TQMa8 families of SOM from zeus-tqma8 branch

### Changed

* setup-environment: adjust usage info and Freescale / NXP EULA handling
  to current configuration
* meta-dumpling: improve busybox configuration
* meta-dumpling: add missing packages to packagegroup-wifi and
  packagegroup-hwutils
* meta-tq: update TQMa8Mx/TQMa8MxML/TQMa8MxNL to kernel 5.10
* update layers to hardknott
* ci: build improvements

### Removed

* meta-imx dependency for TQMa8 boards
* templates: drop separate mirror / ci config
* support for PPC targets

For a list of detailed changes see changelogs in git submodules for meta-tq and
meta-dumpling.

## zeus.TQMLS1012AL.BSP.SW.0010

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMLS1012AL.BSP.SW.0009

### Added

* ci/build-all: add tqma335x to TI_TARGETS

### Changed

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMLX2160A.BSP.SW.0009

### Added

* sources/templates: add image-features config fragment
  * global handling for `IMAGE_FSTYPES`, prepare removal from machine files in
    meta-tq
  * remove `debug-tweaks` from `EXTRA_IMAGE_FEATURES` and `EXTRA_FEATURES`
    This kind of stuff should explicitly set be set in local.conf if needed
    for development.

### Changed

* Update of meta-tq: see CHANGELOG.md in meta-tq
* ci: improve shell coding style
* treewide: fix spelling of TQ-Systems GmbH

### Fixed

* ci/build-all: force a clean generated conf dir in buildspace for every run
* ci/Jenkinsfile: prevent errors in submodule code in case of build needs to
  manipulate submodules

## zeus.TQMLS10xxA.BSP.SW.0103

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMLS1028A.BSP.SW.0105

See the changelogs of meta-tq and meta-dumpling for detailed list of
changes in those layers.


## zeus.TQMLS1028A.BSP.SW.0104

See the changelog of meta-tq for changes in this layer.


## zeus.TQMLS1012AL.BSP.SW.0008

### Changed

* ci: disable Jenkins's builtin submodule handling
  * The manual submodule updates in the scripts run by Jenkins are sufficient
    and more robust.

See the changelog of meta-tq for changes in this layer.


## zeus.TQMLS1028A.BSP.SW.0103

### Changed

* Extended build scripts with support for tqmlx2160 platform

See the changelogs of meta-tq and meta-dumpling for changes in those layers.


## zeus.TQ.Yocto.BSP.SW.0001

This is a joint release for multiple TQMaxx and TQMLSxx module families. It can
also be found under the following tag names:

* zeus.TQMa6x.BSP.SW.0118
* zeus.TQMa7x.BSP.SW.0111
* zeus.TQMa6ULx.BSP.SW.0113
* zeus.TQMLS1012AL.BSP.SW.0007
* zeus.TQMLS102xA.BSP.SW.0115
* zeus.TQMLS1028A.BSP.SW.0102

### Changed

* ci: improve support for multiple Git tags pointing at the same revision
* ci: pass -k to bitbake for fetch step to show all missing downloads in the log
* imx: build new tq-image-weston image instead of fsl-image-multimedia-full
* imx: do not include meta-freescale-distro layer by default

See the changelogs of meta-tq and meta-dumpling for changes in those layers.


## zeus.TQMa57xx.BSP.SW.0013

### Changed

* meta-tq: tqma57xx: errata i863 application fixed
* meta-tq: tqma57xx: Linux: mba57xx dt cleanup
  * license header to SPDX
  * spidev: add tq,testdev
  * enet: move phy props from emac
  * add arch to top-level compatible strings
  * drm/panel: replace cdtech display with mainline patch
  * move touch node to display dts
  * fixed display dts naming
  * fixed display brightness

## zeus.TQMa6x.BSP.SW.0117 / zeus.TQMa7x.BSP.SW.0110 / zeus.TQMa6ULx.BSP.SW.0112 / zeus.TQMLS1012AL.BSP.SW.0006 / zeus.TQMLS102xA.BSP.SW.0114 / zeus.TQMLS1028A.BSP.SW.0101

### Added

* meta-tq: tqma\[6,6ul,6ull,7\], tqmls102xa: added kernel linux-tq 5.4
* meta-tq: tqma\[6,6ul,6ull,7\], tqmls102xa: added kernel linux-rt-tq 5.4
* meta-tq: tqma\[6,6ul,6ull,7\], tqmls1028a: added kernel linux-imx-tq 5.4
  * The corresponding userland packages (imx-gpu-*, libdrm, weston) for the
    Vivante graphics stack (TQMa6x) have been updated from meta-freescale
    to match the kernel version
* meta-tq: tqmls1028a: added u-boot-lsdk-tq 2019.10 (based on LSDK 20.04)
* meta-tq: tqmls1012al: added new embedded module and its starterkit baseboard
  MBLS1012AL

### Changed

* meta-tq: tqma\[6,6ul,6ull,7\]: A mainline-based kernel (linux-tq) is now
  chosen by default when use-mainline-bsp is added to MACHINEOVERRIDES
  (`MACHINEOVERRIDES .= ":use-mainline-bsp"`)
* meta-tq: tqma\[6ul,6ull,7\]: The kernel configuration was changed to use the
  better supported mainline graphics stack. The linux-imx mxcfb stack is only
  used on TQMa6x now.
* meta-tq: tqmls10xxa, tqmls1028a: the meta-freescale layer has been made
  mandatory for these machines
* meta-tq: tqmls10xxa: the variable BOOTMODE can be set to "sd" or "emmc" to
  choose between SD card and eMMC boot configuration
* meta-tq: tqmls1028a: SD card and eMMC boot configurations have been merged
  and are now supported by a single image
* meta-tq: tqmls1028a: changed to TF-A (Trusted Firmware) boot
  * The U-Boot environment for SPI-NOR boot moved to offset 5 MiB
  * The U-Boot environment for eMMC/SD card boot moved to offset 8 MiB
  * The PPA (Primary Protected Application) package was replaced with ATF
    (ARM Trusted Firmware)
  * For more information about the TF-A boot process please refer to the
    NXP Layerscape SDK User Guide

### Removed

* meta-tq: tqma\[6,7\], tqmls102xa: removed kernel linux-tq 4.14
* meta-tq: tqma\[6,7\], tqmls102xa: removed kernel linux-rt-tq 4.14
* meta-tq: tqma\[6,6ul,6ull,7\]: removed kernel linux-imx-tq 4.14
* meta-tq: tqma6q-nav: removed machine

## zeus.TQMa57xx.BSP.SW.0012

### Fixed

* tqma57xx: U-Boot: patched fatfs support

## zeus.TQMa57xx.BSP.SW.0011

### Changed

* meta-tq: tqma57xx: U-Boot: update u-boot on vfat partition

### Fixed

* meta-tq: tqma57xx: U-Boot: implement errata i863 workaround: mmc2 no pullups
* meta-tq: tqma57xx: Linux: implement errata i863 workaround: mmc2 no pullups
* meta-tq: tqma57xx: Linux: enable USB2 OTG mode on MBa57xx

## zeus.TQMa57xx.BSP.SW.0010

### Added

* meta-tq: tqma57xx: Linux: add TI Linux 5.4 (tagged 07.00.00.05-rt)

### Fixed

* meta-tq: tqma57xx: U-Boot: update to set pru mac from eeprom
* meta-tq: tqma57xx: added pci to MACHINE_FEATURES

## warrior.TQMLS10xx.BSP.SW.0101

### Fixed

* meta-tq: tqmls10xxa: several bug-fixes

### Added

* meta-tq: support for TQMLS1043a 2GB variant

## warrior.TQMa6x.BSP.SW.0115

* meta-tq: u-boot changes for TQMa7x and TQMa6x

## warrior.TQMa6ULx.BSP.SW.0110

### Added

* meta-tq: support for TQMa6UL\[L\]x 512 MB variants

### Changed

* ci: improve mirror source archiving

### Fixed

* meta-tq: i.MX SOM - missing SDMA firmware when building without meta-freescale
* meta-tq: i.MX SOM - default Kernel / Bootloader providers not assigned using "?="

## warrior.TQMa57xx.BSP.SW.0008

### Added

* meta-tq: support for TQMa6ULLxL

### Changed

* meta-tq: update to BSP.0008 for TQMa57xx
* meta-tq: doc fixes for TQMa57xx
* meta-ti: update to latest master (warrior compatible)
* ci: improve support scripts
* meta-tq: TQMa6x devicetree and defconfig updates
* meta-tq: change TQMa57xx machine names

## warrior.TQMLS10xx.BSP.SW.0100

### Added

* meta-tq: support for TQMLS1046 8G variant
* meta-tq: support for TQMLS1088

### Changed

* meta-freescale: update to latest warrior
* meta-openembedded: update to latest warrior
* meta-ti: update to latest master (warrior compatible)
* poky: update to latest warrior

### Fixed

* ci: buildhistroy QA errors

## warrior.MBa6ULxL.BSP.SW.0101

### Added

* meta-tq: experimental support for TQMT104x

### Changed

* ci: Jenkinsfile: remove unused configuration
* ci: better approach to archive source packages
* doc: change README to markdown
* doc: add CHANGELOG
* meta-tq: update for new kernel / u-boot releases for MBa6ULxL
* meta-dumpling: cleanup and doc improvements

### Fixed

* ci: Jenkinsfile: shared sstate handling with wrong var name

## warrior.TQMLS102xA.BSP.SW.0112

### Added

* meta-tq: TQMLS1021A RS485 configuration

### Changed

* meta-tq: fix kernel defconfigs for TQMa6UL, TQMa7, TQMa6x, TQMLS102xA

## warrior.TQMLS102xA.BSP.SW.0111

### Added

* meta-tq: TQMLS1021A audio support

### Changed

* ci: cleanup
* ci: use new Jenkins features for build case
* meta-layers: update to latest warrior head

### Fixed

* templates: use own-mirrors only if SOURCE_MIRROR_URL is set
* git: use https submodule url
* git: use relative url for TQ meta layers

## warrior.TQMa7x.BSP.SW.0108 / warrior.TQMa6ULx.BSP.SW.0107

### Added

* support image generation for all TQMa7x memory variants

### Changed

* meta-tq: port TQMa57xx xupport to yocto warrior
* meta-tq: port TQMa6UL\[L\]x\[L\] xupport to yocto warrior
* meta-tq: port TQMa7x xupport to yocto warrior
* meta-tq: update kernel to NXP rel_imx_4.14.78 (TQMa6UL\[L\]x\[L\] and TQMa7x)
* meta-tq: update TQMa57xx to yocto warrior
* meta-dumpling: improve tq-image-generic

## old releases
