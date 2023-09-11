# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := xgboost
$(PKG)_WEBSITE  := https://github.com/dmlc/xgboost
$(PKG)_DESCR    := XGBoost
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.7.6
$(PKG)_CHECKSUM := 0a54300dd274b98b7f039acffa006bec4875dace041fd9288422306fe7c379ca
$(PKG)_GH_CONF  := dmlc/xgboost/releases/latest,v
$(PKG)_SUBDIR   := $(PKG)
$(PKG)_URL      := https://github.com/dmlc/xgboost/releases/download/v$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' \
        -DYAML_CPP_BUILD_TESTS=OFF \
        -DYAML_CPP_BUILD_TOOLS=OFF \
        -DBUILD_STATIC_LIB=ON
    $(MAKE) -C '$(BUILD_DIR)' -j $(JOBS) VERBOSE=1
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

endef
