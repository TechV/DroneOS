#############################################################
#
# rpic-controller 
#
#############################################################
RPIC_CONTROLLER_VERSION = master
RPIC_CONTROLLER_SITE_METHOD = git
RPIC_CONTROLLER_REPO_URL = https://github.com/TechV/controller.git
RPIC_CONTROLLER_SITE = $(call qstrip,$(RPIC_CONTROLLER_REPO_URL))
#PIGPIO_INSTALL_STAGING = YES

#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all

define RPIC_CONTROLLER_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RPIC_CONTROLLER_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install 
endef

$(eval $(generic-package))
