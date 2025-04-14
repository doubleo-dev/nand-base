#
# RIOT OS patched ESP-IDF downloader
#
# Usage               make -f ~/nand-submodules/esp-idf.Makefile
# Manual              https://github.com/doubleo-dev/nand-submodules/README.md
#
# Download location  ~/nand-submodules/RIOT/build/pkg/esp32_sdk
#
# Copyright (c)       2025 doubleO Co., Ltd.
# Author              Jongmin Kim <jmkim@debian.org>

RIOTBASE                ?= $(HOME)/nand-submodules/RIOT
PKGDIRBASE              ?= $(RIOTBASE)/build/pkg
PKG_DIR                 ?= $(RIOTBASE)/pkg/esp32_sdk
PKG_SOURCE_DIR          ?= $(PKGDIRBASE)/esp32_sdk
PKG_BUILD_OUT_OF_SOURCE ?= 1

include $(PKG_DIR)/Makefile

# Apply the additional patches locally:
#
#   Fix broken rtc_io.h declaration and prevent sys/uio.h inclusion outside RIOT
#
# Forwarded           https://github.com/RIOT-OS/RIOT/pull/21408
# Patch location      ~/nand-submodules/esp-idf.patches/*.patch
LOCAL_ESP_IDF_PATCHES   = $(wildcard ~/nand-submodules/esp-idf.patches/*.patch)

all:
	cd $(PKG_SOURCE_DIR); git am $(LOCAL_ESP_IDF_PATCHES)
