#
# Copyright (C) 2014-2018 OpenWrt-dist
# Copyright (C) 2019 [CTCGFW] Project OpenWRT
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=FileBrowser
PKG_VERSION:=v2.0.13
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=[CTCGFW] Project OpenWRT

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/filebrowser/filebrowser.git
PKG_SOURCE_VERSION:=85ee63af43794bcb8becb38c32f39d4a5b6a49f7
PKG_SOURCE_DATE:=20191011

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
GO_PKG_INSTALL_EXTRA:=frontend

GO_PKG:=github.com/filebrowser/filebrowser

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk


define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=LuCI Support for FileBrowser.
	URL:=https://github.com/filebrowser/filebrowser
  	DEPENDS:=$(GO_ARCH_DEPENDS) 
endef

define Package/$(PKG_NAME)/description
LuCI Support for FileBrowser.
endef

define Build/Compile
	# reference: https://filebrowser.xyz/contributing
	# echo "++++++++++++++++++"
	# echo "$(PKG_INSTALL_DIR)"
	# echo "$(GO_PKG_BUILD_DIR)"
	# echo "++++++++++++++++++"
	( \
		cd $(GO_PKG_BUILD_DIR)/src/$(GO_PKG)/frontend; \
		npm install; \
		npm run build; \
	)

	# 123123123
	$(call GoPackage/Build/Compile)
endef

define Package/$(PKG_NAME)/install
	# echo "++++++++++++++++++"
	# echo "$(PKG_INSTALL_DIR)"
	# echo "$(1)"
	# echo "$(GO_PKG_BUILD_BIN_DIR)"
	# echo "++++++++++++++++++"

	# $(INSTALL_DIR) $(1)/usr/bin/
	# $(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/rclone $(1)/usr/bin/
endef

$(eval $(call GoBinPackage,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))