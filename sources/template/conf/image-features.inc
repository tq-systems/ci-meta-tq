# TODO:
# security: force removal of debug-tweaks in any case 
# (local.conf.template of poky will add it by default, which is considered bad).
# this will also be set by some image recipes of NXP
# It is better to provide an own template in our build environment which is easier
# to maintain
EXTRA_IMAGE_FEATURES_remove = " debug-tweaks"
IMAGE_FEATURES_remove = " debug-tweaks"

# this allows for passwordless login of root for development
# see Yocto Procect documentation when needed passwordless / root login with ssh
EXTRA_IMAGE_FEATURES_append = " empty-root-password"

IMAGE_FSTYPES_remove = "tar.xz wic.xz"
IMAGE_FSTYPES_remove = "wic.gz wic.bz2 tar.bz2 sdcard sdcard.bz2 ext2.gz "
IMAGE_FSTYPES_append = " tar.gz ext4 wic"

IMAGE_CLASSES_remove = "image_types_fsl"
IMAGE_CLASSES_remove = "image_types_create_sdcard_symlink"
