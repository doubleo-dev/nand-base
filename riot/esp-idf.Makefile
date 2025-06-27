#
# RIOT OS patched ESP-IDF downloader
#
# Usage                 make -f ~/nand-base/riot/esp-idf.Makefile
# Manual                https://github.com/doubleo-dev/nand-base/riot/README.md
#
# Download location     ~/nand-base/riot/RIOT/build/pkg/esp32_sdk
#
# Copyright (c)         2025 doubleO Co., Ltd.
# Author                Jongmin Kim <jmkim@debian.org>

RIOTBASE                ?= $(HOME)/nand-base/riot/RIOT
PKGDIRBASE              ?= $(RIOTBASE)/build/pkg
PKG_DIR                 ?= $(RIOTBASE)/pkg/esp32_sdk
PKG_SOURCE_DIR          ?= $(PKGDIRBASE)/esp32_sdk
PKG_BUILD_OUT_OF_SOURCE ?= 1

include $(PKG_DIR)/Makefile

# Apply the additional patches locally if exist
LOCAL_ESP_IDF_PATCHES   = $(wildcard ~/nand-base/riot/esp-idf.patches/*.patch)

all:
ifneq ($(strip $(LOCAL_ESP_IDF_PATCHES)),)
	cd $(PKG_SOURCE_DIR); git am $(LOCAL_ESP_IDF_PATCHES)
endif
