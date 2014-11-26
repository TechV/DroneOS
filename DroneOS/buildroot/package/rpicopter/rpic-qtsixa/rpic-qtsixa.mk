#############################################################
#
# rpic-qtsixa
#
#############################################################
#QTSIXA_VERSION = ac0a6c3ef460acebd8f60fa9a44946056deed0aa
RPIC_QTSIXA_VERSION = master
RPIC_QTSIXA_SITE_METHOD = git
RPIC_QTSIXA_REPO_URL = https://github.com/rpicopter/QtSixA.git
RPIC_QTSIXA_SITE = $(call qstrip,$(RPIC_QTSIXA_REPO_URL))

define RPIC_QTSIXA_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/sixad
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/utils
endef

define RPIC_QTSIXA_INSTALL_TARGET_CMDS
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/usr/bin
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/usr/sbin
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/etc/default
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/etc/init.d
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/etc/logrotate.d
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/var/lib/sixad
       $(INSTALL) -m 0755 -d              $(TARGET_DIR)/var/lib/sixad/profiles

	$(INSTALL) -m 644 $(@D)/sixad/sixad.default $(TARGET_DIR)/etc/default/sixad
	$(INSTALL) -m 644 $(@D)/sixad/sixad.default $(TARGET_DIR)/etc/init.d/sixad
	$(INSTALL) -m 644 $(@D)/sixad/sixad.log $(TARGET_DIR)/etc/logrotate.d/sixad
	$(INSTALL) -m 755 $(@D)/sixad/sixad $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 755 $(@D)/sixad/bins/sixad-bin $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 $(@D)/sixad/bins/sixad-sixaxis $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 $(@D)/sixad/bins/sixad-remote $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 $(@D)/sixad/bins/sixad-3in1 $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 $(@D)/sixad/bins/sixad-raw $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 $(@D)/sixad/sixad-dbus-blocker $(TARGET_DIR)/usr/sbin/
	@chmod 777 -R $(TARGET_DIR)/var/lib/sixad/


	$(INSTALL) -m 755 $(@D)/utils/bins/sixpair $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -m 755 $(@D)/utils/bins/sixpair-kbd $(TARGET_DIR)/usr/local/bin/
	$(INSTALL) -m 755 $(@D)/utils/bins/hidraw-dump $(TARGET_DIR)/usr/local/bin/
endef

$(eval $(generic-package))
