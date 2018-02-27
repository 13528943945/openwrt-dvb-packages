#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tbs-firmware
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.tbsdtv.com/download/document/linux
PKG_HASH:=fc400730a20ee638a1309be3723c663f297a36771fba2ce5f240ab41ca45ffd2
PKG_SOURCE:=tbs-tuner-firmwares_v${PKG_VERSION}.tar.bz2
PKG_LICENSE:=custom:firmware

PKG_MAINTAINER:=Vladimír Záhradník <vladimir.zahradnik@gmail.com>

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

define Package/tbs-firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=https://www.tbsdtv.com/
  TITLE:=$(1)
  PKG_BUILD_DEPENDS:=+linux-firmware
endef

define Build/Compile

endef

include $(wildcard ./*.mk)
#$(eval $(call BuildPackage,linux-firmware))