# allow automatic building with meta-freescale
ACCEPT_FSL_EULA = "y"

# clean after build to save space
INHERIT += "rm_work"
RM_OLD_IMAGE = "1"

# Log information on images and packages
INHERIT += "buildhistory"

# sometimes it is needed to revert a package version
# if using build history (meta-freescale-distro) this will give an QA error
# remove package and sdk from the features default set
BUILDHISTORY_FEATURES = "image"

# Uncomment to disable commits
# BUILDHISTORY_COMMIT = "0"

INHERIT += "buildstats"
