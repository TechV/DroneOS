#############################################################
#
# MotionSensorExample 
#
#############################################################
RPIC_MOTIONSENSOREXAMPLE_VERSION = master
RPIC_MOTIONSENSOREXAMPLE_SITE_METHOD = git
RPIC_MOTIONSENSOREXAMPLE_REPO_URL = https://github.com/rpicopter/MotionSensorExample.git
RPIC_MOTIONSENSOREXAMPLE_SITE = $(call qstrip,$(RPIC_MOTIONSENSOREXAMPLE_REPO_URL))
#PIGPIO_INSTALL_STAGING = YES

#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all

define RPIC_MOTIONSENSOREXAMPLE_BUILD_CMDS
endef


define RPIC_MOTIONSENSOREXAMPLE_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install 
endef 

$(eval $(generic-package))
