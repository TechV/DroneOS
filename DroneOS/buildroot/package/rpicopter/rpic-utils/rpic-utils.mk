#############################################################
#
# rpic-utils 
#
#############################################################
RPIC_UTILS_VERSION = master
RPIC_UTILS_SITE_METHOD = git
RPIC_UTILS_REPO_URL = https://github.com/rpicopter/utils.git
RPIC_UTILS_SITE = $(call qstrip,$(RPIC_UTILS_REPO_URL))
#PIGPIO_INSTALL_STAGING = YES

#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all

define RPIC_UTILS_BUILD_CMDS
endef


define RPIC_UTILS_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install 
endef 

$(eval $(generic-package))
