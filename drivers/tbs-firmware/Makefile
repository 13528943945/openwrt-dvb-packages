#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tbs-firmware
PKG_VERSION:=1.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.bz2
PKG_SOURCE_URL:=git://github.com/tbsdtv/media_build.git
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=0

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define Package/v4l-dvb-tbs
  SECTION:=multimedia
  CATEGORY:=Multimedia
#  DEPENDS:=kmod-dvb-core +@KERNEL_KALLSYMS
  DEPENDS:=+kmod-usb-core +kmod-dma-buf +kmod-firewire +kmod-input-core +kmod-regmap +kmod-sound-core
  TITLE:=V4L-DVB-TBS
  URL:=http://www.linuxtv.org/
endef

define Package/v4l-dvb-tbs/description
  TBS proprietary firmware
endef

MAKE_VARS += \
	TOPDIR="" \
	KDIR=$(LINUX_DIR) \
	DIR=$(LINUX_DIR)\
	SRCDIR=$(LINUX_DIR)

define Build/Prepare
	$(call Build/Prepare/Default)
	if [ -d $(DL_DIR)/linux_media ] ; then (cd $(DL_DIR)/linux_media;git pull); else git clone --single-branch --depth 1 git://github.com/tbsdtv/linux_media.git  $(DL_DIR)/linux_media;  fi
	( cd $(PKG_BUILD_DIR)/linux ; make tar DIR=$(DL_DIR)/linux_media )
	$(call Build/Compile/Default,untar)
#	$(call Build/Compile/Default,allmodconfig)
#	$(call Build/Compile/Default,xconfig)
#	$(call Build/Compile/Default,stagingconfig)
#	$(call Build/Compile/Default,allmodconfig)
	$(call Build/Compile/Default,menuconfig)
#	mv $(PKG_BUILD_DIR)/v4l/Makefile.media $(PKG_BUILD_DIR)/v4l/Makefile.media.old
#	cat $(PKG_BUILD_DIR)/v4l/Makefile.media.old | sed -r 's|\s+strip\s+| ${STRIP} |g' >$(PKG_BUILD_DIR)/v4l/Makefile.media
endef

#define Build/Configure
#	$(call Build/Compile/Default,tar DIR=$(DL_DIR)/linux_media)
#	$(CP) $(LINUX_DIR)/.config $(PKG_BUILD_DIR)/v4l/.config
#endef

define Build/Compile
#	$(call Build/Compile/Default,download)
#	$(call Build/Compile/Default,untar)
#	$(call Build/Compile/Default,allmodconfig)
#	$(call Build/Compile/Default,stagingconfig)
	$(call Build/Compile/Default)
#	$(call Build/Compile/Default,install)
endef


define Package/v4l-dvb-tbs/install
#	$(call Build/Compile/Default,install)
	$(INSTALL_DIR) $(1)/lib/modules/$(LINUX_VERSION)
#	$(FIND) $(PKG_INSTALL_DIR) -name *.$(LINUX_KMOD_SUFFIX) -type f | xargs cp -t $(1)/lib/modules/$(LINUX_VERSION)/
	$(FIND) $(PKG_INSTALL_DIR) -name *.$(LINUX_KMOD_SUFFIX) -type f -exec cp "{}" $(1)/lib/modules/$(LINUX_VERSION)/ \;
endef

$(eval $(call BuildPackage,v4l-dvb-tbs))
