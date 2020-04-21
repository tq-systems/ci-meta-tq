# only for poky-based DISTRO
# or if DISTRO includes uninative config data - otherwise build fails with missing
# UNINATIVE_CHECKSUM[arch]
#INHERIT += "uninative"
#
#UNINATIVE_SUBDIR = "uninative/${@d.getVarFlag('UNINATIVE_CHECKSUM', d.getVar('BUILD_ARCH', True), True)}"
#UNINATIVE_MIRRORDIR = "${SOURCE_MIRROR_URL}/${UNINATIVE_SUBDIR}"
#
#PREMIRRORS_prepend = "\
#${UNINATIVE_URL}${UNINATIVE_TARBALL} ${UNINATIVE_MIRRORDIR}/${UNINATIVE_TARBALL} \n \
# "
