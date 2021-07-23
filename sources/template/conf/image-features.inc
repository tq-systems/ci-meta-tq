# security: do not allow debug-tweaks as default setting
# (local.conf.template of poky will add it with ?=, which is considered bad for
# release builds).
# It is better to provide an own template in our build environment which is
# easier to maintain
EXTRA_IMAGE_FEATURES = " "
IMAGE_FEATURES = " "

# this allows for passwordless login of root for development
# see Yocto Procect documentation when needed passwordless / root login with ssh
EXTRA_IMAGE_FEATURES_append = " empty-root-password"

# remove some image types / classes from vendor layers to save space
IMAGE_FSTYPES_remove = "tar.xz wic.xz"
IMAGE_FSTYPES_remove = "wic.gz wic.bz2 tar.bz2 sdcard sdcard.bz2 ext2.gz "
IMAGE_FSTYPES_append = " tar.gz ext4 wic"

IMAGE_CLASSES_remove = "image_types_fsl"
IMAGE_CLASSES_remove = "image_types_create_sdcard_symlink"
