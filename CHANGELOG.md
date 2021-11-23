# Changelog

All notable changes to this project will be documented in this file.
Releases are named with the following scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

## zeus.TQMLS1028A.BSP.SW.0106

### Changed

* Update of meta-tq
* Update of meta-dumping

See the CHANGELOG.md files in the individual layer directories for details on
the updates.

## zeus.TQMaRZG2x.BSP.SW.0003

### Changed

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMa335x.BSP.SW.0121

### Changed

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMaRZG2.BSP.SW.0002

### Added

* ci: support building for TQMaRZG2 family of SOM
* sources/meta-tq: add support for TQMaRZG2 family of SOM
  see CHANGELOG.md in meta-tq

### Changed

* ci: build improvements

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
