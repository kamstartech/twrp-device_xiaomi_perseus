#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/perseus

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA84000 androidboot.hardware=qcom androidboot.console=ttyMSM0 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true loop.max_part=7 androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1d84000.ufshc
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# QCOM
#TARGET_USE_SDCLANG := true

# Assert
TARGET_OTA_ASSERT_DEVICE := perseus

# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67092480
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# Dynamic Partitions - Updated to match LineageOS 22
BOARD_SUPER_PARTITION_SIZE := 5704253440
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 5700059136 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB overhead
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor

# Super partition metadata device
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor cust
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3758096384
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1073741824
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 872415232

# Filesystem types and sizes
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 248848035840
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# Dynamic partition copy-out paths - LineageOS 22 compatible
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Additional filesystem types for logical partitions
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Crypto - DISABLED for troubleshooting
TW_INCLUDE_CRYPTO := false
# TW_INCLUDE_FBE := true
# TW_INCLUDE_FSCRYPT_POLICY := true
# BOARD_USES_QCOM_FBE_DECRYPTION := true

# Platform crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
VENDOR_SECURITY_PATCH := 2099-12-31

# Additional FBE support - DISABLED
# TW_USE_FSCRYPT_POLICY := 2
# TW_INCLUDE_CRYPTO_FBE := true
# TARGET_HW_DISK_ENCRYPTION := true
# TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Keymaster - DISABLED
# TARGET_KEYMASTER_VARIANT := op
# TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# Additional modern encryption support
# TW_CRYPTO_USE_SYSTEM_VOLD := true  # Temporarily disabled due to build issues
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_LOGICAL_PARTITIONS := true

# MultiROM support - Updated for logical partitions compatibility
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/xiaomi/perseus/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1.5
MR_FSTAB := device/xiaomi/perseus/recovery.fstab
MR_KEXEC_MEM_MIN := 0x20000000
MR_KEXEC_DTB := true
MR_USE_MROM_FSTAB := true
MR_CONTINUOUS_FB_UPDATE := true
MR_DEVICE_HOOKS := device/xiaomi/perseus/mr_hooks.c
MR_DEVICE_HOOKS_VER := 1
MR_DEVICE_RECOVERY_HOOKS := device/xiaomi/perseus/mr_recovery_hooks.c
MR_DEVICE_RECOVERY_HOOKS_VER := 1
# MultiROM logical partition support
MR_DEVICE_HAS_LOGICAL_PARTITIONS := true
MR_LOGICAL_PARTITIONS := system,vendor,product,system_ext,odm

# TWRP specific build flags - Enhanced for LineageOS 22 compatibility
TW_THEME := portrait_hdpi
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_SCREEN_BLANK_ON_BOOT := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true

# Hybrid partition support - works with both logical and traditional
# Removed TW_INCLUDE_LOGICAL_PARTITIONS to avoid "unhandled flag" errors
# TW_INCLUDE_LOGICAL_PARTITIONS := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.date.utc;ro.bootimage.build.date.utc;ro.build.display.id;ro.build.id;ro.build.tags;ro.build.version.incremental"
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
# MultiROM-compatible partition handling
TW_ENABLE_BLKDISCARD := true

# Additional debug logging - crypto debugging disabled
TW_NO_SCREEN_TIMEOUT := true
# TW_DEBUG_DECRYPT := true
# TW_CRYPTO_SYSTEM_VOLD_DEBUG := true

# TWRP version requirements for LineageOS 22 compatibility
TW_DEVICE_VERSION := 1
TW_HAS_DOWNLOAD_MODE := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
