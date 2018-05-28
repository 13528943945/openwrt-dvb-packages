#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LINUX_MEDIA_REPO_NAME:=linux_media
MEDIA_BUILD_REPO_NAME:=media_build
LINUX_MEDIA_REV:=c5c972582ad6306772a92dfb4f72157683f3c7ec
MEDIA_BUILD_REV:=22135571ac56f40e3f4887648626ad70375da196

PKG_NAME:=tbs-drivers
PKG_DATE:=2018-05-23
PKG_VERSION:=$(PKG_DATE)+git-$(LINUX_MEDIA_REV)
PKG_RELEASE:=1
PKG_MAINTAINER:=Vladimir Zahradnik <vladimir.zahradnik@gmail.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILE:=COPYING

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(MEDIA_BUILD_REPO_NAME)

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(MEDIA_BUILD_REPO_NAME)-$(PKG_DATE)+git-$(MEDIA_BUILD_REV).tar.xz
PKG_MIRROR_HASH:=7e9a3e3a7dffc1f60c3180a531e2ac8a0f36808fa3cee81225153d1eddeac492
PKG_SOURCE_URL:=git://github.com/tbsdtv/$(MEDIA_BUILD_REPO_NAME).git
PKG_SOURCE_VERSION:=$(MEDIA_BUILD_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(MEDIA_BUILD_REPO_NAME)
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
	$(call Prepare/linux_media)
endef

define Download/linux_media
	VERSION:=$(LINUX_MEDIA_REV)
	HASH:=14ffc9627cbf58c520dbcc8dd26187fbaeff6275a289dd32a67514d5b78f092b
	SUBDIR:=$(PKG_NAME)-$(LINUX_MEDIA_REPO_NAME)
	FILE:=$(PKG_NAME)-$(LINUX_MEDIA_REPO_NAME)-$(PKG_VERSION).tar.xz
	URL:=git://github.com/tbsdtv/$(LINUX_MEDIA_REPO_NAME).git
	PROTO:=git
endef

define Prepare/linux_media
	$(eval $(call Download,linux_media))
	(tar -C $(PKG_BUILD_DIR) -xJf $(DL_DIR)/$(FILE))
endef

define Build/Compile
	#(ls -la; pwd;)
	$(call Build/Compile/Default,dir,DIR="$(PKG_BUILD_DIR)/$(PKG_NAME)-$(LINUX_MEDIA_REPO_NAME)")
	$(call Build/Compile/Default,distclean)
	$(call Build/Compile/Default)
endef

$(eval $(call BuildPackage,tbs-drivers))