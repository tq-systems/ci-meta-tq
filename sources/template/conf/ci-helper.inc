# allow automatic building with meta-freescale
ACCEPT_FSL_EULA = "y"

# clean after build to save space
INHERIT += "rm_work"
# Do not use 'RM_OLD_IMAGE' - this prevents building multiple bootstreams
# nightly builds / release builds should clean before build
# RM_OLD_IMAGE = "1"

# sometimes it is needed to revert a package version
# if using build history (meta-freescale-distro) this will give an QA error
# remove package and sdk from the features default set
BUILDHISTORY_FEATURES = "image"
