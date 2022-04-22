#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r3q

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Media
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# Platform
TARGET_BOOTLOADER_BOARD_NAME := msmnile
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msmnile
BOARD_VENDOR := samsung

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image-dtb
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_DTB_OFFSET := 0x01F00000

BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true

TARGET_KERNEL_CONFIG := r3q_defconfig
TARGET_KERNEL_ARCH := arm64

## Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# Display
TARGET_SCREEN_DENSITY := 420

# Manifest
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
     hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
     vendor/evolution/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += \
     $(DEVICE_PATH)/manifest.xml \
     $(DEVICE_PATH)/lineage_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Fs config
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := efs

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_DTBOIMG_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6239027200
BOARD_VENDORIMAGE_PARTITION_SIZE := 1415577600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 82694144
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor

# Fingerprint
TARGET_SEC_FP_REQUEST_TOUCH_EVENT := true
TARGET_SEC_FP_REQUEST_FORCE_CALIBRATE := true
TARGET_USES_FOD_ZPOS := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400000000LL
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.r3q

# Configs File System
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# OTA assert
TARGET_OTA_ASSERT_DEVICE := r3q,r3qxx

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/batt_slate_mode
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 0
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 1
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# Vibrator
$(call soong_config_set,samsungVibratorVars,duration_amplitude,true)

# SePolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
     $(DEVICE_PATH)/sepolicy/private \
     $(DEVICE_PATH)/tools/sepolicy \
     hardware/samsung-ext/interfaces/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
include device/qcom/sepolicy_vndr-legacy-um/SEPolicy.mk

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

include vendor/samsung/r3q/BoardConfigVendor.mk
