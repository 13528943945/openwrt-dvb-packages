Package/tbs5520se-firmware = $(call Package/tbs-firmware-default,TBS 5520SE USB firmware)
define Package/tbs5520se-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/tbs
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/dvb-usb-id5520se.fw \
		$(1)/lib/firmware/tbs
endef
$(eval $(call BuildPackage,tbs5520se-firmware))

