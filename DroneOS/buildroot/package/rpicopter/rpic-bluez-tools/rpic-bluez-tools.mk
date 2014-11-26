#############################################################
#
# rpic-bluez-tools 
#
#############################################################
RPIC_BLUEZ_TOOLS_VERSION = master
RPIC_BLUEZ_TOOLS_SITE_METHOD = git
RPIC_BLUEZ_TOOLS_REPO_URL = https://github.com/rpicopter/bluez-tools.git
RPIC_BLUEZ_TOOLS_SITE = $(call qstrip,$(RPIC_BLUEZ_TOOLS_REPO_URL))
RPIC_BLUEZ_TOOLS_INSTALL_TARGET = YES
RPIC_BLUEZ_TOOLS_AUTORECONF = YES

$(eval $(autotools-package))
