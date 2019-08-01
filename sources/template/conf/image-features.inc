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
