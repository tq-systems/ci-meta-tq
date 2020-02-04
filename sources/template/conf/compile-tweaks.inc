# TODO:
# security: force removal of debug-tweaks in any case
# (local.conf.template of poky will add it by default, which is considered bad).
# this will also be set by some image recipes of NXP
# It is better to provide an own template in our build environment which is easier
# to maintain

BBMASK_append += "/meta-qoriq-demos/recipes-core/glibc/glibc_2.27.bbappend"
