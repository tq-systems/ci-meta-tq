# Changelog

All notable changes to this project will be documented in this file.
Releases are named with thefollowing scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

## warrior.MBa6ULxL.BSP.SW.0101

### Added

meta-tq: experimental support for TQMT104x

### Changed

ci: better approach to archive source packages
doc: change README to markdown
doc: add CHANGELOG
meta-tq: update for new kernel / u-boot releases for MBa6ULxL
meta-dumpling: cleanup and doc improvements

## warrior.TQMLS102xA.BSP.SW.0112

### Added

meta-tq: TQMLS1021A RS485 configuration

### Changed

meta-tq: fix kernel defconfigs for TQMa6UL, TQMa7, TQMa6x, TQMLS102xA

## warrior.TQMLS102xA.BSP.SW.0111

### Added

meta-tq: TQMLS1021A audio support

### Changed

ci: cleanup
ci: use new Jenkins features for build case
meta-layers: update to latest warrior head

### Fixed

templates: use own-mirrors only if SOURCE_MIRROR_URL is set
git: use https submodule url
git: use relative url for TQ meta layers

## warrior.TQMa7x.BSP.SW.0108 / warrior.TQMa6ULx.BSP.SW.0107

### Added

support image generation for all TQMa7x memory variants

### Changed

meta-tq: port TQMa57xx xupport to yocto warrior
meta-tq: port TQMa6UL\[L\]x\[L\] xupport to yocto warrior
meta-tq: port TQMa7x xupport to yocto warrior
meta-tq: update kernel to NXP rel_imx_4.14.78 (TQMa6UL\[L\]x\[L\] and TQMa7x)
meta-tq: update TQMa57xx to yocto warrior
meta-dumpling: improve tq-image-generic

## old releases
