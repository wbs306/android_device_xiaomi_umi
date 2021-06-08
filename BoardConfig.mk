#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/umi

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Fingerprint
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_X = 439
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_Y = 1806
SOONG_CONFIG_XIAOMI_KONA_FOD_SIZE = 197

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/umi_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc OEM_TARGET_PRODUCT=$(PRODUCT_DEVICE)
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=

# Inherit from xiaomi sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

# inherit from the proprietary version
include vendor/xiaomi/umi/BoardConfigVendor.mk
