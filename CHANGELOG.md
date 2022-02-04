# Changelog

All notable changes to this project will be documented in this file.
Releases are named with the following scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

## rocko.TQMaRZG2x.BSP.SW.0010

### Added

* meta layers for GPU and video CODEC support via meta-rzg2
  * meta-gplv2
  * meta-rzg2
  * meta-linaro
  * meta-qt5
  * meta-virtualization

### Changed

* tqmarzg2x: backported to rocko
* Update of meta-tq: see CHANGELOG.md in meta-tq
* Update of meta-dumpling: see CHANGELOG.md in meta-dumpling

## zeus.TQMaRZG2x.BSP.SW.0003

### Changed

* Update of meta-tq: see CHANGELOG.md in meta-tq

## zeus.TQMaRZG2.BSP.SW.0002

### Added

* ci: support building for TQMaRZG2 family of SOM
* sources/meta-tq: add support for TQMaRZG2 family of SOM
  see CHANGELOG.md in meta-tq

### Changed

* ci: build improvements

