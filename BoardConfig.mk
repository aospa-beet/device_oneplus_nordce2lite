# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/oneplus/nordce2lite

include build/make/target/board/BoardConfigMainlineCommon.mk

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    vendor

# AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 4

BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := odm vendor
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 5

BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Display density
TARGET_SCREEN_DENSITY := 480

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/configs/vintf/oplus_vendor_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/vintf/manifest.xml

# Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_oplus

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=4e00000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    ip6table_raw.raw_before_defrag=1 \
    iptable_raw.raw_before_defrag=1 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    pcie_ports=compat \
    service_locator.enable=1 \
    swiotlb=0

BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_BINARIES := kernel
BOARD_KERNEL_PAGESIZE := 4096
KERNEL_DEFCONFIG := vendor/holi-qgki_defconfig
USE_KERNEL_AOSP_LLVM := true

BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
    $(KERNEL_MODULES_OUT)/apr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bt_fm_slim.ko \
    $(KERNEL_MODULES_OUT)/btpower.ko \
    $(KERNEL_MODULES_OUT)/camera.ko \
    $(KERNEL_MODULES_OUT)/machine_dlkm.ko \
    $(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/native_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/platform_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wlan.ko \
    $(KERNEL_MODULES_OUT)/rmnet_core.ko \
    $(KERNEL_MODULES_OUT)/rmnet_ctl.ko \
    $(KERNEL_MODULES_OUT)/rmnet_offload.ko \
    $(KERNEL_MODULES_OUT)/rmnet_shs.ko \
    $(KERNEL_MODULES_OUT)/sia81xx_dlkm.ko \
    $(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
    $(KERNEL_MODULES_OUT)/stub_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wsa881x_analog_dlkm.ko

# OTA
TARGET_OTA_ASSERT_DEVICE := OP535DL1,nordce2lite

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0xA000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL-GKI_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

BOARD_SUPER_PARTITION_SIZE := 11190403072
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 11188310016 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103
TARGET_USERIMAGES_USE_F2FS := true

# Soong
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public

# Touch
TARGET_POWER_FEATURE_EXT_LIB := //$(DEVICE_PATH):libpowerfeature_ext_nordce2lite
