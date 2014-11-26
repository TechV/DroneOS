#############################################################
#
# rpic-pigpio 
#
#############################################################
#RPIC_PIGPIO_VERSION = a26ed773d7792cca7f67c7baca530940cb991e5d
RPIC_PIGPIO_VERSION = master
RPIC_PIGPIO_SITE_METHOD = git
RPIC_PIGPIO_REPO_URL = https://github.com/rpicopter/pigpio.git
RPIC_PIGPIO_SITE = $(call qstrip,$(RPIC_PIGPIO_REPO_URL))
#PIGPIO_INSTALL_STAGING = YES

#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all

define RPIC_PIGPIO_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RPIC_PIGPIO_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -d              $(TARGET_DIR)/opt/pigpio/cgi
	$(INSTALL)  -m 0755 -d              $(TARGET_DIR)/usr/local/include
	$(INSTALL)  -m 0644 $(@D)/pigpio.h        $(TARGET_DIR)/usr/local/include
	$(INSTALL) -m 0644 $(@D)/pigpiod_if.h    $(TARGET_DIR)/usr/local/include
	$(INSTALL) -m 0755 -d              $(TARGET_DIR)/usr/local/lib
	$(INSTALL) -m 0644 $(@D)/libpigpio.a     $(TARGET_DIR)/usr/local/lib
	$(INSTALL) -m 0644 $(@D)/libpigpiod_if.a $(TARGET_DIR)/usr/local/lib
	$(INSTALL) -m 0755 -d              $(TARGET_DIR)/usr/local/bin
	$(INSTALL) -m 0755 $(@D)/pig2vcd         $(TARGET_DIR)/usr/local/bin
	$(INSTALL)  -m 0755 $(@D)/pigpiod        $(TARGET_DIR)/usr/local/bin
	$(INSTALL)  -m 0755 $(@D)/pigs           $(TARGET_DIR)/usr/local/bin

endef

$(eval $(generic-package))
