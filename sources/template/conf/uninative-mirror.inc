# only for poky-based DISTRO
# or if DISTRO includes uninative config data - otherwise build fails with missing
# UNINATIVE_CHECKSUM[arch]
INHERIT += "uninative"

UNINATIVE_SUBDIR = "uninative/${@d.getVarFlag('UNINATIVE_CHECKSUM', d.getVar('BUILD_ARCH', True), True)}"
UNINATIVE_MIRRORDIR = "${SOURCE_MIRROR_URL}/${UNINATIVE_SUBDIR}"
UNINATIVE_PREMIRROR = "${UNINATIVE_URL}${UNINATIVE_TARBALL} ${UNINATIVE_MIRRORDIR}/${UNINATIVE_TARBALL}\n"

PREMIRRORS:prepend = "${@ d.getVar('UNINATIVE_PREMIRROR') if d.getVar('SOURCE_MIRROR_URL') else '' }"
