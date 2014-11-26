#############################################################
#
# rpic-avrcontroller 
#
#############################################################
RPIC_AVRCONTROLLER_VERSION = master
RPIC_AVRCONTROLLER_SITE_METHOD = git
RPIC_AVRCONTROLLER_REPO_URL = https://github.com/rpicopter/AvrMiniCopter.git
RPIC_AVRCONTROLLER_SITE = $(call qstrip,$(RPIC_AVRCONTROLLER_REPO_URL))
#PIGPIO_INSTALL_STAGING = YES

#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/rpi all

define RPIC_AVRCONTROLLER_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/rpi all
endef

define RPIC_AVRCONTROLLER_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/rpi install 
endef

$(eval $(generic-package))
