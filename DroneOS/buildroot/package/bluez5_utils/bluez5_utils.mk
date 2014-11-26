################################################################################ 
# 
# bluez5_utils 
# 
################################################################################ 
 
BLUEZ5_UTILS_VERSION = 5.17
BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
BLUEZ5_UTILS_INSTALL_STAGING = YES
BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 libical readline
BLUEZ5_UTILS_CONF_OPT = --enable-tools --enable-library --enable-sixaxis 
BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB

# experimental plugins
ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
	BLUEZ5_UTILS_CONF_OPT += --enable-experimental
else
	BLUEZ5_UTILS_CONF_OPT += --disable-experimental
endif
 
# install gatttool (For some reason upstream choose not to do it by default) 
ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
define BLUEZ5_UTILS_INSTALL_GATTTOOL 
	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin 
endef 
BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL 
endif 

define BLUEZ5_UTILS_INSTALL
	$(LIBTOOL) --finish /usr/lib/bluetooth/plugins
	$(LIBTOOL) --finish /usr/lib
endef
 
# enable test 
ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y) 
	BLUEZ5_UTILS_CONF_OPT += --enable-test 
else 
	BLUEZ5_UTILS_CONF_OPT += --disable-test 
endif 
 
# use udev if available 
ifeq ($(BR2_PACKAGE_UDEV),y) 
        BLUEZ5_UTILS_CONF_OPT += --enable-udev 
        BLUEZ5_UTILS_DEPENDENCIES += udev 
else 
        BLUEZ5_UTILS_CONF_OPT += --disable-udev 
endif 
 
# integrate with systemd if available 
ifeq ($(BR2_PACKAGE_SYSTEMD),y) 
        BLUEZ5_UTILS_CONF_OPT += --enable-systemd 
        BLUEZ5_UTILS_DEPENDENCIES += systemd 
else 
        BLUEZ5_UTILS_CONF_OPT += --disable-systemd 
endif 
 
$(eval $(autotools-package))
