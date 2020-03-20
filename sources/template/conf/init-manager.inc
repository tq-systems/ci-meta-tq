##
# from poky/tree/meta-poky/conf/local.conf.sample.extended
##

#
# Use busybox/mdev for system initialization
#
#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
#VIRTUAL-RUNTIME_login_manager = "busybox"
#VIRTUAL-RUNTIME_init_manager = "busybox"
#VIRTUAL-RUNTIME_initscripts = "initscripts"
#VIRTUAL-RUNTIME_keymaps = "keymaps"
#DISTRO_FEATURES_BACKFILL_CONSIDERED += "systemd"
#DISTRO_FEATURES_remove += "systemd"

#
# Use systemd for system initialization
#
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_remove = " sysvinit"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
VIRTUAL-RUNTIME_login_manager = "shadow-base"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
