#############################################################
#
# rpic-servoblaster
#
#############################################################
#SERVOBLASTER_VERSION = ac0a6c3ef460acebd8f60fa9a44946056deed0aa
RPIC_SERVOBLASTER_VERSION = master
RPIC_SERVOBLASTER_SITE_METHOD = git
RPIC_SERVOBLASTER_REPO_URL = https://github.com/rpicopter/servoblaster.git
RPIC_SERVOBLASTER_SITE = $(call qstrip,$(RPIC_SERVOBLASTER_REPO_URL))

define RPIC_SERVOBLASTER_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/user all
endef

define RPIC_SERVOBLASTER_INSTALL_TARGET_CMDS
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/usr/local/bin
       $(INSTALL) -m 0755 $(@D)/user/servod         $(TARGET_DIR)/usr/local/bin
endef

$(eval $(generic-package))
