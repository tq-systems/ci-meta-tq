# allow automatic building with meta-freescale
ACCEPT_FSL_EULA = "y"

# clean after build to save space
INHERIT += "rm_work"
RM_OLD_IMAGE = "1"

# sometimes it is needed to revert a package version
# if using build history (meta-freescale-distro) will give an QA error in that
# case
BUILDHISTORY_CHECKVERBACKWARDS = "0"
