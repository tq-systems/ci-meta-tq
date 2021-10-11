
# remove non used packed tar formats
IMAGE_FSTYPES_remove = "tar.xz tar.bz2"
# removed packed wic images
IMAGE_FSTYPES_remove = "wic.gz wic.bz2 wic.xz"
# remove fsl sdcard images
IMAGE_FSTYPES_remove = "sdcard sdcard.bz2"
# remove packed ext images
IMAGE_FSTYPES_remove = "ext2.gz ext4.gz"

# we will have tar.gz for NFS, ext4 and wic for SD / e-MMC
IMAGE_FSTYPES_append = " tar.gz ext4 wic"
