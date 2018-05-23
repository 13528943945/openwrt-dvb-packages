#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tbs-drivers
PKG_DATE:=2018-05-23
PKG_REV:=0fd4b64b40e11036d58021b419afa66584346e11
PKG_VERSION:=$(PKG_DATE)+git-$(PKG_REV)
PKG_RELEASE:=1
PKG_REPO_NAME:=linux_media
PKG_MAINTAINER:=Vladimir Zahradnik <vladimir.zahradnik@gmail.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILE:=COPYING

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REPO_NAME)-$(PKG_VERSION).tar.xz
PKG_MIRROR_HASH:=da69fe9082e849c3d6aa88440b5851ff8070e7e6586a6e47f3635ae284deda29
PKG_SOURCE_URL:=git://github.com/tbsdtv/$(PKG_REPO_NAME).git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REPO_NAME)
PKG_BUILD_PARALLEL:=1

# Repository with build scripts
MEDIA_BUILD_REPO_NAME:=media_build

include $(INCLUDE_DIR)/package.mk

define Package/tbs-drivers
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+kmod-usb-core
  TITLE:=TBS open-source Linux drivers
  URL:=https://github.com/tbsdtv
endef

define Package/tbs-drivers/description
This package contains open-source Linux drivers for
selected TV tuner cards and video capture cards
by TBS Technologies International Inc.

For a full list of supported hardware, please, visit:
https://github.com/tbsdtv/linux_media/wiki
endef

define Build/Prepare
  $(call Build/Prepare/Default)
  $(call Prepare/media_build)
endef

define Download/media_build
  SUBDIR:=$(PKG_NAME)-$(MEDIA_BUILD_REPO_NAME)
  VERSION:=22135571ac56f40e3f4887648626ad70375da196
  HASH:=7e9a3e3a7dffc1f60c3180a531e2ac8a0f36808fa3cee81225153d1eddeac492
  FILE:=$(PKG_NAME)-$(MEDIA_BUILD_REPO_NAME)-$(PKG_DATE)+git-$$(VERSION).tar.xz
  URL:=git://github.com/tbsdtv/$(MEDIA_BUILD_REPO_NAME).git
  PROTO:=git
endef

define Prepare/media_build
  $(eval $(call Download,media_build))
endef

$(eval $(call BuildPackage,tbs-drivers))