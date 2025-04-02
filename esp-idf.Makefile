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
