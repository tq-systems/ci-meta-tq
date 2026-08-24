# Changelog

All notable changes to this project will be documented in this file.
Releases are named with the following scheme:

`<Yocto Project version name>.<TQ module family>.BSP.SW.<version number>`

**NOTE:** For details to the changes in a release see the CHANGELOG.md
files in git the submodule for meta-tq (meta layers meta-tq and meta-dumpling).

[[_TOC_]]

## Next Release

## scarthgap.TQ.ARM.BSP.0011

### Changed

* reenable insane checks for CI mirroring
* templates: update uninative mirror handling and leave uninativ INHERIT up to distro
* CI: improved coding style in scripts

### Fixed

CI: check for non-interactive builds to prevent interactive license acceptance query

## scarthgap.TQ.ARM.BSP.0010

### Added

* meta-cyclonedx: add submodule (iris-GmbH/meta-cyclonedx, scarthgap branch) for CycloneDX SBOM and VEX generation
* build_all: add `--sbom` option to enable CycloneDX SBOM/VEX generation (implied by `--release=yes`)
* templates: add meta-cyclonedx to all bblayers.conf.sample; configure output path and spec version in auto.conf.ci

### Changed

* meta-yocto: update to 2f749ae477c3b94dce71038f025180d7f612dab0 (yocto-5.0.19)
* openembedded-core: update to 2814f0962f56c8d1afa4de76d2895ba9b5cb767d (yocto-5.0.19)
* bitbake: update to 0880963fea4d91a034e4a6e007d23f98658ab986 (yocto-5.0.19)
* meta-qt6: update to 2a9a0070f652134e15df332918a012862bf34047 (v6.8.4-lts-lgpl)
* meta-openembedded: update to 7eb94107580092f79ff1b639a87762fe6f96aa12
* meta-arm: update to 23b572c40ea6709ab3f8bd7abbb5a795fc3631c2
* meta-ti: update to 6759bb35871fb4f17a2463bee641aa6df6a3d048
* meta-freescale: update to 4143744bc82508f00395a0ffe30e624b2341176a

### Fixed

* meta-tq: security fixes for linux-tq_6.6 / linux-tq_6.12

## scarthgap.TQ.ARM.BSP.0009

* meta-tq: update u-boot-tq_2026.01 with 1GiB Nanya RAM support
* meta-tq: update TF-A to 2.12 for all i.MX and layerscape based machines
* meta-yocto: update to c7c38663a1cafb1fa8593c0b246811e51d3bbe20 (includes yocto-5.0.17)
* openembedded-core: update to 52380df998b3a8fe6a091f8547434a3231320a8e (includes yocto-5.0.17)
* bitbake: update to d3b4c352dd33fca90cd31649eda054b884478739 (yocto-5.0.17)
* meta-openembedded: update to 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e
* meta-ti: update to edac88403004bb712bf1711ce83750dc26c7fee3
* meta-rauc: update to d63878f20eba7a85ecf53566e7a3377e78bb46ac
* templates: do not use multi-line assignment in bblayers.conf.sample

  No functional change. Use one assignment per line makes maintenance easier.


## scarthgap.TQ.ARM.BSP.0008

### Changed

* meta-yocto: update to 94d19f9d8392f8a125764df0f8eda04205c7e76c (includes yocto-5.0.16)
* openembedded-core: update to a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375 (includes yocto-5.0.16)
* bitbake: update to 10118785e4a670bce4980e1044c0888a8b6e84af (yocto-5.0.16)
* meta-rauc: update to a687885f3f3ebfcab5865a587a2f0ac8e591899e
* meta-openembedded: update to 4d3e2639dec542b58708244662d5ce36810fc510
* meta-ti: update to 5258ee2f903d8f1e0cbcb9d01488d08b57314009

## scarthgap.TQ.ARM.BSP.0007

### Added

* meta-tq: new machines for TQMa95xxLA on MBa95xxCA and TQMa95xxSA on MB-SMARC-2
* ci: add new group for i.MX95 based SOM to include in i.MX builds
* meta-tq: new machine for TQMa93xxLA on MBa93xxLA-MINI
* meta-tq: add PREEMPT_RT 6.12 support for TQMa335x and TQMLS102xA

### Changed

* poky: replaced by dedicated submodules

  bitbake, openembedded-core and meta-yocto are now used instead of poky combo
  repository. The poky repo will only be maintained for existing releases.
  Since the mentioned repos are the source of poky simply switch to the
  revisions that are equivalent to poky 5.0.15 release.
* poky: update to 72983ac391008ebceb45edc7a8f0f6d5f4fe715c, include 5.0.15
* meta-openembedded: update to 2759d8870ea387b76c902070bed8a6649ff47b56
* meta-freescale: update to 902dde8c5bd29bb507ac8d37772565a6c9ab77cd
* meta-ti: update to da28ae30cabd39ebce054ea2e230548d9b9c3322
* poky: update to e6bfeed8f3e72c577820e3d01f7d697c4d3fc5d4, include 5.0.14
* meta-arm: update to a81c19915b5b9e71ed394032e9a50fd06919e1cd
* meta-ti: update to ee5c64043811d1469c11ea14e760d5124dc46eb7
* meta-openembedded: update to 89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099
* poky: update to ad597f4a54ec5b51677160d537b87b1b7e3828db, include 5.0.13
* meta-ti: update to f7cd5f92135bd53a843b188bce559ec894425766
* meta-freescale: update to 7d83a350d8b28498321a481a2a1c51bb4afb48e9
* meta-openembedded: update to 15e18246dd0c0585cd1515a0be8ee5e2016d1329
* poky: update to 6400741e0c11d1620a5ebe394d24deec295236f9, include 5.0.12
* meta-ti: update to 11a60314cf00695f0131b6d955667d502a93165a
* meta-freescale: update to 212f4b3b175f6d58c691192545454cd2d2e908d9
* meta-arm: update to 0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46
* meta-openembedded: update to c29a18fa39ede952f3f6108ec007c1906e2d9a0d
* meta-tq: update patch revisions for linux-tq-6.6 / linux-tq-6.12 / linux-imx-tq-6.6
* ci: rework git archive script

## scarthgap.TQ.ARM.BSP.0006

### Added

* meta-tq: new machine for TQMa8MPxS on MB-SMARC-2
* meta-tq: secure boot support for TQMLX2160A

### Changed

* meta-freescale: update to 4ea1005c570ce783bb0a4130159b6af8615ce273
* poky: update to ae2d52758fc2fcb0ed996aa234430464ebf4b310, include 5.0.11
* meta-openembedded: update to e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943
* meta-freescale: update to 3a266d9aac5e0d4535aa0832fa9fe6ede56b44e9

## scarthgap.TQ.ARM.BSP.0005

### Added

* meta-tq: new machine for TQMa67xx on MBa67xx starter kit mainboard
* templates:
  * add `meta-rauc` to `mainline`, `ti` and `imx` templates to prepare wider usage of RAUC examples.
  * add `meta-arm` and `meta-arm-toolchain` to `mainline` template to prepare usage of `optee`.
* submodules: add `meta-rauc` to allow usage of RAUC example without additional manual steps.

### Changed

* poky: update to ac257900c33754957b2696529682029d997a8f28, prepare 5.0.10
* meta-openembedded: update to 491671faee11ea131feab5a3a451d1a01deb2ab1
* poky: update to fa7bc4c1a8e1e59d57e6deeaf74f7784975ab9b4, prepare 5.0.9
* meta-ti: update to 8c258e731e62954ff41460febc2c036fb5ca552c
* meta-arm: update to 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
* meta-openembedded: update to e92d0173a80ea7592c866618ef5293203c50544c
* meta-tq: updated to f2ad7046cf1087659a32f204267939bb6ee03875
  * linux-imx-tq 6.6 support for TQMLS1028A and TQMLS1012AL
  * linux-tq 6.12 (LTS) support for TQMLX2160A and TQMLS102xA
  * generate compressed WIC images by default (usable with bmap-tool)
* meta-qt6: switch to branch 6.8 and update to c58fdf7af5d92f5dc0a3446a9865580511ae8691
  Qt 6.8 is maintained as LTS version.

## scarthgap.TQ.ARM.BSP.0004

### Added

* ci:
  * enable mainline builds for mainboards using TQMa93xx SOM
  * enable mainline builds for MBa8MP-RAS314 SBC
  * enable imx builds for i.MX91 based SOM
* meta-tq:
  * Verified Boot demo for TQMa93xx and TQMa91xx
  * restore support for MBa6ULxL SBC
  * prepare RAUC support for TQMa93xx and TQMa91xx
  * add initial support for MBaMP-RAS314 SBC
  * add initial support for TQMa91xx[CA,LA] SOM

### Changed

* meta-tq: updated to c677015a1551d00ae6213085e16ddb9019803470
  * linux 6.12 LTS support for TQMa335x and TQMa93xx
  * experimental linux-rt 6.12 for TQMa8MPxL and TQMa93xx
* poky: updated to dc4827b3660bc1a03a2bc3b0672615b50e9137ff, prepare 5.0.8
* meta-arm: updated to 3cadb81ffaa9f03b92e302843cb22a9cd41df34b
* meta-openembedded: updated to 6c9f1f8d4538119803bf793747b65e4d23c33544
* meta-ti: updated to ed05150b00376cc3e6e466f2ee9d9df60e37996a (11.00.06)
  * Notably, meta-ti does not set `UBOOT_SIGN_ENABLE` anymore for K3 SoCs
    (AM62/AM64/...), so by default the kernel is not verified on
    secure-boot-enabled machines. If desired, signing can be enabled in a
    custom machine or distro.
* meta-freescale: updated to a8a6b9d1b274f1a24e4d75243af1bbde011b2ebb
* meta-tq: updated to f06fd2ae13bdd8ee8855c554aa458fa0b9f19647
  * use buildinfo when building a distro from `meta-dumpling
  * add wifi to DISTRO_FEATURES when not building a tiny distro
* templates: add layers meta-arm and meta-arm-toolchain to `imx`-template
  configuration
* poky: updated to 2541a8171f91812a4b16e7dc4da0d77d2318a256, prepare 5.0.7
* meta-openembedded: updated to dda0d53326017d6758ec6bdfdaf2f484c089d13f
* meta-freescale: updated to de62184d9f94e888d9ef7d0d741cd8c38be0b9aa
  * prepare i.MX91 support
* ci:
  * do not depend on hidden environment variables
  * improve version name string generation

### Fixed

* ci: fix error handling in git-revision-name.sh

## scarthgap.TQ.ARM.BSP.0003

### Changed

* ci: cleanups in preparation of Jenkins deprecation
* poky: updated to 2541a8171f91812a4b16e7dc4da0d77d2318a256, includes 5.0.6
* meta-ti: updated to 4213a71a8eaed4a57562c0608f9ba29efc39eede
* meta-openembedded: updated to 3c293e14492f01e22a64004e2330fb620c27578a
* meta-freescale: updated to ed0e245c9f0f50a393e55fdf92228fff52e73710
* meta-arm: updated to a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
* meta-tq:
  * TQMa6x/TQMa6UL[L]x[L]/TQMa7x: update default kernel to Linux 6.6
  * TQMa6x/TQMa6UL[L]x[L]/TQMa7x: update PREEMPT-RT kernel to Linux 6.6
  * TQMa7x/TQMa6UL[L]x[L]: update default bootloader to U-Boot v2023.04 this
    includes some breaking changes. See meta-tq for details.
* poky: updated to dce4163d42f7036ea216b52b9135968d51bec4c1, includes 5.0.5
* meta-ti: updated to d952379f55e14fe11166eaace2960400dd1171e0
* meta-arm: updated to 7088279c0ab00c7dabefdd4544951b4746b48476
* meta-qt6: updated to 416a83c4c4cedde4503239fff0079a66d8aacc16
* meta-openembedded: updated to 2e3126c9c16bb3df0560f6b3896d01539a3bfad7
* meta-freescale: updated to a7bf57d45cdd908155b4179845aa9d1d78095bc0
* meta-tq:
  * use common `DEFAULTTUNE` for all ARMv8a based machines in distros defined in
    meta-dumpling
  * unify definitions for `dumpling` family of distros
* ci: make artifact generation for mirror archives and license info machine and
  distro specific

### Added

* meta-tq: add Qt6 example images
* templates: add `meta-qt6` to `bblayers.conf.sample` for `ti` and
  `mainline` configuration template to allow building Qt6 enabled images
  out of the box.

## scarthgap.TQ.ARM.BSP.0002

### Changed

* meta-tq: updated to d790f09d3dafad03afa0a50a9546500479b39ff8
  * TQMa8MPxL/TQMa93xx: NPU support in meta-dumpling
  * TQMa93xx: initial support for secure boot
  * TQMa62xx\[L\] / TQMa64xxL: various fixes for linux-ti-tq 6.6. Both machines
    are now tested and supported again.
* poky: updated to cd44e6bd40b0c1f498b3feaeb5e9b72f8bf32d41, includes 5.0.4
* meta-ti: updated to c82f29cae79c6a4fec79c542649cb832e1fb67ab
* meta-qt6: updated to 38c9b905506bc8515a345cb2fbdd71309ceb1fdb
* meta-openembedded: updated to 72018ca1b1a471226917e8246e8bbf9a374ccf97
* meta-freescale: updated to 01d9ff233a7ae41d39af436f9508103504708b58
* ci:
  * improve parsing and validation of boolean args
  * improve error handling in build scripts
  * remove global classes from CI specific config modification to lower the IO
    related build time for merge requests. SPDX generation will be reenabled
    for release build jobs.

### Fixed

* ci:
  * fix a condition check in fill_mirror script
  * fix help output in build scripts
  * fix check for gnu grep
  * fix building with undefined optional bitbake variables

## scarthgap.TQ.ARM.BSP.0001

### Added

* meta-tq:
  * TQMa62xx/TQMa64xxL: optional inline ECC support
  * TQMLS1043A / TQMLS1046A / TQMLS1088A / TQMLX2160A: support for linux with
    `PREEMPT_RT` using recipe `linux-rt-tq`
  * `linux-imx-tq.6.6` support for TQMa8 and TQMa9 series
* meta-qt6 support

### Changed

* ci: use `--<option>=[yes|no]` for all bool parameters in `build_all` and
  `fill_mirror` scripts
* templates: Do not manipulate IMAGE_FSTYPES in `auto.conf.ci`. Normal builds and
  CI builds should not generate different artifacts by default
* meta-tq:
  * TQMa64xxL: support new variants
  * TQMLS1028A: support new variants
* poky: updated to 5.0.3
* meta-arm: updated to 38bce82e42ea093333a53c4a10e51d1b26cbc989
* meta-ti: updated to 84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e
* meta-qt6: updated to d94723e4d50898459c9f2f450978d0fb9074fa89
* meta-openembedded: updated to 2338409efc51cf2022ff5610a9fb689251706e2b
* meta-freescale: updated to 1425fda62f7fa2f6bedaf0b2c41b2dae9ec1c3e7
* ci:
  * allow to deploy multiple wic images per machine_archive
  * create release archives only if needed
* meta-tq:
  * TQMa6x: support all variants of the SoM on the MBa6x starter kit
    base board with a single machine definition. The machine is called
    `tqma6x-multi-mba6x` and builds all boot images and WIC images for the
    different RAM configurations and form factors.
  * TQMLS1043A / TQMLS1046A / TQMLS1088A / TQMLX2160A: switch to use `linux-tq`
    recipe
  * TQMa6ULLx[L]: support all variants of the SoM on the MBa6ULx starter kit
    base board with a single machine definition. The machine is called
    `tqma6ull-multi-mba6ulx` and builds all boot images and WIC images for the
    different RAM configurations and form factors.
  * TQMa6ULx[L]: support all variants of the SoM on the MBa6ULx starter kit
    base board with a single machine definition. The machine is called
    `tqma6ul-multi-mba6ulx` and builds all boot images and WIC images for the
    different RAM configurations and form factors.
  * TQMa7x: support all variants of the SoM on the MBa7 starter kit base boards
    with a single machine definition. The machine is called `tqma7x-multi-mba7`
    and builds all boot images and WIC images for the different RAM configurations.
* ci: improve coding style
* meta-dumpling: Explicitly set variable `INIT_MANAGER` for distro definition.

### Removed

* CI: build-config.json: Remove support for building and finding deprecated
  machines. The machines are still buildable with older yocto releases.
* meta-qt5 support
* meta-tq:
  * Support for TQM7S has been removed
  * Support for TQMa57xx has been removed
  * Support for TQMa654x has been removed
  * Support for MBa6ULxL has been removed
  * Removed obsolete recipes

### Fixes:

* ci: `ls-machines` parses `build-config.json` for TI based SoM correctly now.

## kirkstone.TQ.ARM.BSP.0018

### Module BSP Revisions

* kirkstone.TQMa93xx.BSP.SW.0002

### Added

* meta-tq: TQMa93xx[CA,LA]:
  * update RAM-Timing to support multiple set points
  * add support for 2 GB SoM variants

### Changed

* meta-tq: TQMLX2160A: update kernel version to to linux v6.1
* ci:
  * Rewrite scripts to use build_config.json by default. The old behaviour of
    ls-distros / ls-machines / ls-configs is kept when using new command line
    arguments.

## kirkstone.TQ.ARM.BSP.0017

### Module BSP Revisions

* kirkstone.TQMa57xx.BSP.SW.0015

### Added

* meta-tq: TQMa8MPxL: NPU support
  * Install tensorflow-lite when meta-freescale-ml is added
  * meta-freescale-ml layer is added using git submodules

### Changed

* poky: updated to 4.0.16
* meta-freescale: updated to 710e55d529c86d15a93c4421365ef62eb601a49b
* meta-openembedded: updated to 8609de00952d65bb813a48c535c937324efeb18a
* ci/buildall: improve per machine info output
* ci: script style fixes
* meta-tq:
  * TQMa8MxML: support all variants of the SoM on the MBa8Mx starter kit base boards
    with a single machine definition. The machine is called `tqma8mx-multi-mba8mx`
    and builds all boot images and WIC images for the different RAM configurations.
  * TQMa8Mx: support all variants of the SoM on the MBa8Mx starter kit base boards
    with a single machine definition. The machine is called `tqma8mx-multi-mba8mx`
    and builds all boot images and WIC images for the different RAM configurations.
  * linux-imx-tq\_6.1: Enable `CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS` for better
    support for PIE post-mortem debugging

### Fixed

* meta-tq: compatibility fix for linux-firmware from poky v4.0.16
* ci: do not longer depend on bitbake require/include logic in template config files
  and setup scripts

  Related to this change, some variables like `IMAGE_FSTYPES` are now set in
  `meta-tq` machine configs instead of ci-meta-tq's `auto.conf`. Updating to
  this version of (ci-)meta-tq may require configuring these variables in custom
  machine, distro or `local.conf` configurations if image types other than the
  default WIC image and `.tar.gz` archive need to be built.

  This fixes https://github.com/tq-systems/ci-meta-tq/issues/7
* ci/buildall: file and directory cleanup for special use cases

## kirkstone.TQ.ARM.BSP.0016

### Module BSP Revisions

* kirkstone.TQMa93xx.BSP.SW.0001

### Fixed

* ci:
  * fixed error handling for ci/setup_builddir
  * fixed using relative artifact directories

### Changed

* ci: do not create `build_info` file multiple times
* meta-ti: updated to 461eee98bde6112562fb24c43729856f937bb091
  Fixed recipes for AM335x / AM57xx GPU support
* poky: updated to 4.0.15
* meta-freescale: updated to 47e0b467d8555e38a996b731977d9eed9ab02051
* meta-openembedded: updated to 402affcc073db39f782c1ebfd718edd5f11eed4c
* meta-qt5: updated to f5dfcd1417fa01dc59b3fc1f28bbe7c986de0e9d (kirkstone-next)
* meta-tq:
  * TQMa93: build for SoM with CPU chip revision A1 / 2.0 by default
  * TQMa8: Switched to 6.1 as preferred version for linux-imx-tq.

## kirkstone.TQ.ARM.BSP.0015

### Module BSP Revisions

* kirkstone.TQMa62xx.BSP.SW.0001

### Changed

* meta-tq:
  * TQMa62xx: Switched to HS-FS (High Security - Field Securable) firmware
    variant for default tiboot3.bin

### Fixed

* meta-tq:
  * TQMa62xx: Disabled unreliable SoC-internal RTC
  * TQMa62xx: Fixed cpufreq on Linux

## kirkstone.TQ.ARM.BSP.0014

### Module BSP Revisions

* kirkstone.TQMa6x.BSP.SW.0123

### Added

* meta-tq:
  * TQMa62xx: New module
  * linux-ti-tq 6.1: New kernel for TQMa62xx/TQMa64xxL
  * u-boot-ti-tq 2023.04: New U-Boot for TQMa62xx/TQMa64xxL
  * linux-imx-tq 6.1: Support for TQMa8x / TQMa8Xx / TQMa8XxS
    SoM support ported to FSLC based fork of NXP vendor kernel linux-imx

### Changed

* meta-ti: Updated to 09.01.00.005

  This update introduces some incompatible changes for TI-based modules. See
  the meta-tq changelog for details.
* ci:
  * Drop gitlab support in Jenkinsfile.
  * Prepare configurable artifacts destination.
  * Use bitbake variables to get build artifacts. This enables setups where
    `DEPLOY_DIR_IMAGE` uses a non default value.
  * Use `bitbake-getvar` instead of `bitbake -e` plus shell based filtering to
    query bitbake variables. This depends on `poky` > v4.0.14.
* poky: updated to latest kirkstone head to include fixes for bitbake-getvar
  and more CVE fixes
* poky: updated to 4.0.14
* meta-arm: updated to yocto-4.0.3
* meta-openembedded / meta-qt5: update to latest kirkstone head
  to integrate fixes and stay in sync with upstream

### Removed

* meta-tq:
  * Support for the TQMa65xx module has been removed. kirkstone.TQ.ARM.BSP.0013
    or older must be used for this hardware.
  * u-boot-ti-tq 2021.01: Removed recipe due to incompatibility with current
    meta-ti. u-boot-tq 2023.04 is used for the TQMa64xxL now.

## kirkstone.TQ.ARM.BSP.0013

### Module BSP Revisions

* kirkstone.TQMa6x.BSP.SW.0122

### Added

* meta-tq:
  * TQMa6DL with 2 GiB
  * U-Boot v2023.04 (for TQMa6x machines)

### Changed

* TQMa335x
  * kernel configuration clean-up and limited support for newer meta-ti

## kirkstone.TQ.ARM.BSP.0012

### Module BSP Revisions

* kirkstone.TQMa64xxL.BSP.SW.0006

### Added

* TQMT10xx
  * Added support for new rcw configurations

### Fixed

* TQMa64xxL
  * u-boot: Do not set ethXaddr variables in environment for MAC addresses that
    are not actually assigned to the module

    This affects the TQMa6411L variant, which does not support PRU Ethernet, so
    only a total of 2 instead of 5 MAC addresses are assigned per module.
* TQMLX2160A
  * Fixed wrong UART Clock in U-Boot. The Linux UART driver relies on firmware
    initialisation of UART clock. So this fixes Linux UART clock as well.

## kirkstone.TQ.ARM.BSP.0011

### Module BSP Revisions

* kirkstone.TQMLS10xxA.BSP.SW.0106

### Added

* meta-tq:
  * Added machines for new TQMLS10xxA memory variants

## kirkstone.TQ.ARM.BSP.0010

### Module BSP Revisions

* kirkstone.TQMa64xxL.BSP.SW.0005

### Fixed

* meta-tq:
  * TQMa8Mx / TQMa8MxML / TQMa8MxNL / TQMa8MPxL: fixed compatibility for TF-A >= 2.6
    for Cortex-M demos. Older versions do not boot with new TF-A.
  * TQMa93: fixed console handling for busybox init
  * TQMa8MPxL: fixed reserved memory in DTB for linux-imx-tq
  * TQMa8: restored U-Boot environment tool in rootfs
  * SOM with i.MX CPU: fixed building UBI images depending on `MACHINE_FEATURE`
    "ubi" when using together with meta-freescale

### Added

* meta-tq:
  * TQMa8MPxL / TQMa8MxML / TQMa8MxNL / TQMa8Mx:
   * backported GPU 6.4.11.p1.2 from meta-freescale master
   * Linux 6.1 FDLC support (new default when compiling with NXP kernel)
  * TQMa6411L: initial support for CPU variant
  * TQMa93: updated TF-A to v2.8 based version
  * TQMa7 / TQMa6 / TQMa6UL[L]x[L]: Linux 6.1 stable support

### Changed

* poky: updated to 4.0.13
* poky: updated to 4.0.12
* meta-arm: updated to 4.0.2
* meta-openembedded / meta-freescale: updated to integrate fixes and
  stay in sync with upstream
* ci: improved scripts used for development and CI

## kirkstone.TQ.ARM.BSP.0009

### Module BSP Revisions

* kirkstone.TQMa8.BSP.SW.0092

### Fixed

* meta-tq:
  * TQMa8x/TQMa8Xx[4,S]: fix LPI2C driver in linux-imx-tq 5.15


### Changed

* meta-tq:
  * TQMa8x/TQMa8Xx[4,S]: update SCU to new version (no functional change)
  * TQMLS104xA / TQMLS1088A: update to kernel based on 6.1.y
  * TQMLS104xA / TQMLS1088A: recipe adjusments for linux 6.1.y

## kirkstone.TQ.ARM.BSP.0008

### Module BSP Revisions

* kirkstone.TQMLS1028A.BSP.SW.0109

### Added

* meta-tq:
  * TQMa8M*: support for linux-stable / linux-stable-rt (upstream support without
    additional features)
  * TQMa8M*: initial support for U-Boot distro boot / extlinux (still needs some
    bootloader environment modifications)

### Changed

* poky: update to 4.0.11
* meta-openembedded / meta-freescale: update to integrate fixes and stay in sync
  with upstream
* meta-tq:
  * TQMLS1088A: use ATF FIP bootstream
  * TQMLS1088A: update RCW, U-Boot and ATF

### Fixed

* meta-tq: compatibility to poky 4.0.11

## kirkstone.TQ.ARM.BSP.0007

### Module BSP Revisions

* kirkstone.TQMLX2160A.BSP.SW.0010

## kirkstone.TQ.ARM.BSP.0006

### Module BSP Revisions

* kirkstone.TQMa8.BSP.SW.0091

### Changed

* ci: use new distro for layerscape boards allowing build of multiple boot
  only images per machine.
* poky: update to 4.0.10
* meta-openembedded: update to integrate fixes and stay in sync with upstream

### Added

* meta-tq: Add support for more TQMLX2160a CPU and memory variants

## kirkstone.TQ.ARM.BSP.0005

### Module BSP Revisions

* kirkstone.TQMa8.BSP.SW.0090
* kirkstone.TQMa64xxL.BSP.SW.0004

### Added

* meta-tq: Add support for TQMaMxML with 4 GB RAM

### Changed

* poky: update to 4.0.9
* meta-freescale / meta-openembedded: update to integrate fixes and stay in
  sync with upstream
* meta-tq: switch from using the outdated PPA and fixed RCW in U-Boot to use
  RCW and TF-A with FIP for TQMLS104[3,6]A and TQMLS1088A

## kirkstone.TQ.ARM.BSP.0004

### Module BSP Revisions

* kirkstone.TQMa64xxL.BSP.SW.0003
* kirkstone.TQMa8.BSP.SW.0089

### Added

* meta-tq: Add support for TQMa93xxLA on MBa93xxLA SBC
* ci: enable builing TQMT10xx SOM in ls config
* meta-tq: Add support for TQMT10xx SOM with QORIQ T10xx CPU

### Changed

* meta-tq: use upstream i.MX93 support from meta-freescale and drop local copies
  of recipies from meta-imx
* meta-freescale: update to include upstream i.MX93 support
* poky: update to 4.0.8
* meta-tq: Rename machine for TQMa93xxLA / TQMa93xxCA starter kit
* treewide: update TQ copyrights
* treewide: switch to SPDX-License-Identifier
* poky: update to 4.0.7
* meta-tq:
  * harmonize usage of variables in machine files
  * adjust usage of `MACHINE_FEATURES` for screen and touchscreen support to
    poky / OE core
* meta-tq:
  * tqmls1046a: new machine configuration
  * Qt5 support improvements
  * TQMa8Xx[S] / TQMa8x SPI fixes
* layers: update meta-freescale / poky / meta-openembedded / meta-qt5 / meta-arm
  to integrate fixes and stay in sync with upstream
* ci:
  * do not build `cpio.gz` images to save space.
  * extend test-config.json to enable multiple linux images for a machine

### Fixed

* meta-tq:
  * all machines: Fix a race condition due to missing dependencies for `WKS_FILE_DEPENDS`.
* ci:
  * Do not set `SDKMACHINE` in local.conf. `SDKMACHINE` defaults to the
    architecture of the build host now.

## kirkstone.TQ.ARM.BSP.0003

### Module BSP Revisions

* kirkstone.TQMa335x.BSP.SW.0125
* kirkstone.TQMa64xxL.BSP.SW.0002
* kirkstone.TQMa65xx.BSP.SW.0009
* kirkstone.TQMa8.BSP.SW.0088

### Added

* ci: TQMa8M[x,xML,xNL,PxL]: support building with upstream stable kernel
* Templates: add meta-freescale to `mainline` template
  needed to support TQMa8M[x,xML,xNL,PxL] with upstream kernel. Otherwise
  it would be needed to duplicate a lot of recipes

### Changed

* poky: update to 4.0.6
* ci: move templates to a location that fits the new requirements for
  `TEMPLATECONF` in upcoming langdale

### Fixed

* meta-tq:
  * TQMa65xx: PRU and GPU working now under kirkstone
  * TQMa64xx: u-boot and linux bugfixes
  * TQMLS1028A: u-boot and linux bugfixes
  * TQMa335x: linux-ti-tq: PMIC IRQ
  * TQMa8MPxL: u-boot-imx-tq: TSN / Eqos long delay

## kirkstone.TQ.ARM.BSP.0002

### Module BSP Revisions

* kirkstone.TQMa335x.BSP.SW.0124
* kirkstone.TQMLS1012AL.BSP.SW.0012
* kirkstone.TQMLS102xA.BSP.SW.0116

### Added

* meta-tq: initial support for TQMa93xxLA

## kirkstone.TQ.ARM.BSP.0001

### Module BSP Revisions

* kirkstone.TQMa8.BSP.SW.0087
* kirkstone.TQMa6x.BSP.SW.0121
* kirkstone.TQMa7x.BSP.SW.0115
* kirkstone.TQMa6UL.BSP.SW.0117

### Changed

* ci:
  * include distro name in artifacts
  * use matrix builds
* meta-tq: Updates for machines using kernels based on TI linux fork
  * Update to latest upstream meta-ti kirkstone branch
  * TQMa65xx: adjustments for kirkstone
  * TQMa64xx: updates for new hardware version
* meta-tq: support for linux-imx-tq 5.15 (based on fslc imx flavour):
  * TQMa6x
  * TQMa8Mx
  * TQMa8MPxL
  * TQMa8MxML
  * TQMa8MxNL
  * TQMa8x
  * TQMa8Xx
  * TQMa8XxS
* layers / scripts / templates: the content of meta-dumpling repo was
  integrated into meta-tq repo. Both layers are now located in subdirectories
  of the meta-tq repo. This results in:
  * changes of paths to layers
  * changes of bblayers templates
  * remove git submodule of meta-dumpling
* meta-tq: forward port changes from hardknott to kirkstone
* meta-dumpling: forward port changes from hardknott to kirkstone

### Added

* Support for yocto kirkstone

__Start of porting to kirkstone__
------------------------------------------------------------------------

### Changed

* ci: Jenkinsfile: optimized file operations and cleanup dead code
* ci: improve code reuse
* scripts: rewrite setup-environment to reduce complexity and allow usage of
  shells different from bash

### Fixed

* setup-environment: set valid default MACHINE if none is given
* ci: do not use ~ in path names

### Added

* ci: add script to query available configurations
* Support for yocto honister

## hardknott.TQMa6UL.BSP.SW.0116

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
