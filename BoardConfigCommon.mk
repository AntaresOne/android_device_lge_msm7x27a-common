# Copyright (C) 2014 The CyanogenMod Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/lge/msm7x27a-common/BoardConfigVendor.mk

LOCAL_PATH := device/lge/msm7x27a-common

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

BOARD_VENDOR := lge
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7x27a

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_KERNEL_SOURCE := kernel/lge/msm7x27a-common
BOARD_KERNEL_BASE := 0x00200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x1200000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 487136952
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2920577761
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_VOLD_MAX_PARTITIONS := 23
TARGET_USERIMAGES_USE_EXT4 := true

# Don't generate block mode update zips
BLOCK_BASED_OTA := false

# cflags
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480
TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DNO_UPDATE_PREVIEW
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_CAM_PARAMS
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3

# QCOM  display stuffs
TARGET_QCOM_DISPLAY_VARIANT := display-caf
BOARD_USES_QCOM_HARDWARE := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
USE_OPENGL_RENDERER := true
TARGET_USES_QCOM_BSP := true
QCOM_BSP_WITH_GENLOCK := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
HWUI_COMPILE_FOR_PERF := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg

# Media 
TARGET_QCOM_MEDIA_VARIANT := media-caf

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# bluetooth
BOARD_HAVE_BLUETOOTH := true

# BIONIC: use legacy mmap
BOARD_USES_LEGACY_MMAP := true

# Media
TARGET_QCOM_LEGACY_OMX := true

# ION Support
TARGET_USES_ION := true

# audio 
TARGET_QCOM_AUDIO_VARIANT := audio-caf
TARGET_PROVIDES_LIBAUDIO := true
BOARD_QCOM_VOIP_ENABLED := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_HAS_QACT := true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# ART
MALLOC_IMPL := dlmalloc
# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
 ifeq ($(TARGET_BUILD_VARIANT),userdebug)
  ifeq ($(WITH_DEXPREOPT),)
   WITH_DEXPREOPT := true
  endif
 endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# RAdio
TARGET_NEEDS_NON_PIE_SUPPORT := true
BOARD_PROVIDES_LIBRIL := true
BOARD_USES_LEGACY_RIL := true

# Use Cpu Upload path (webkit)
TARGET_FORCE_CPU_UPLOAD := true

BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

USE_DEVICE_SPECIFIC_CAMERA := true

TARGET_NO_INITLOGO := true

SE_SET_METADATA := false
SKIP_SET_METADATA := true
DISABLE_OTA := true
RECOVERY_CANT_USE_CONFIG_EXT4_FS_XATTR := true

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

TARGET_PROVIDES_LIBLIGHT := true

# LOGD
TARGET_USES_LOGD := false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

TARGET_NEEDS_NON_PIE_SUPPORT := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_EXT_MODULE_PATH             := "/system/lib/modules/librasdioif.ko"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_EXT_MODULE_NAME             := "librasdioif"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WIFI_DRIVER_FW_PATH_PARAM        := "/data/misc/wifi/fwpath"
