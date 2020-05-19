# Changelog

All notable changes to this project will be documented in this file.
Releases are named with the following scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

## zeus.TQMa8.BSP.SW.0025

## Changed

* global: build tq-image-weston for imx config
* global: restrict imx config to supported TQMa8 machines
* global: restrict autobuild to imx config
* meta-dumpling: prepare enhanced support for NXP 5.4.3_1.0.0 reference BSP
* global: prepare integration of NXP 5.4.3_1.0.0 reference BSP
* global: update to use zeus

## Added

* meta-dumpling: add recipe for generic weston image
* meta-tq: support for TQMa8Xx REV.020x

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
