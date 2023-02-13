
# remove non used packed tar formats
IMAGE_FSTYPES:remove = "tar.xz tar.bz2"
# removed packed wic images
IMAGE_FSTYPES:remove = "wic.gz wic.bz2 wic.xz"
# remove fsl sdcard images
IMAGE_FSTYPES:remove = "sdcard sdcard.bz2"
# remove packed ext images
IMAGE_FSTYPES:remove = "ext2.gz ext4.gz"

# we will have tar.gz for NFS, wic for SD / e-MMC
IMAGE_FSTYPES:append = " tar.gz wic"
