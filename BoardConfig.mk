# Copyright (C) 2011 The Android Open Source Project
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



# Board properties Hardware
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
TARGET_OMAP3 := true
COMMON_GLOBAL_CFLAGS += -DTARGET_OMAP3 -DOMAP_COMPAT -DMOTOROLA_UIDS
# hack for WVGA records 
COMMON_GLOBAL_CFLAGS += -DWVGA_BUFFERS

# test for wifi calling
BOARD_USE_KINETO_COMPATIBILITY := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_PREINSTALL := true
TARGET_NO_RADIOIMAGE := false
TARGET_BOOTLOADER_BOARD_NAME := begonia

# Wifi related defines
#BOARD_WLAN_DEVICE           := tiwlan0
BOARD_WLAN_DEVICE           := wl1271
BOARD_SOFTAP_DEVICE         := wl1271
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
AP_CONFIG_DRIVER_WILINK     := true
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WPA_SUPPL_APPROX_USE_RSSI   := true
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
#WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := tiwlan_drv
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_tiwlan_ap.bin"
WIFI_FIRMWARE_LOADER        := wlan_loader
#BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
PRODUCT_WIRELESS_TOOLS      := true


# omap3 compat global
HARDWARE_OMX := true
TARGET_USE_OMX_RECOVERY := true
TARGET_USE_OMAP_COMPAT  := true

# Camera
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true

# GPS wrapper
BOARD_USES_GPSSHIM := true
BOARD_GPS_LIBRARIES := libgps.so

# Audio
BOARD_USES_GENERIC_AUDIO := false
BUILD_WITH_TI_AUDIO := 1

# Gps wrapper
BOARD_USES_GPSSHIM := true
BOARD_GPS_LIBRARIES := libgps

# Graphics
BOARD_EGL_CFG := device/motorola/begonia/egl.cfg
BOARD_NO_RGBX_8888 := true
BUILD_PV_VIDEO_ENCODERS := 1	

# Blue Tooth
BOARD_HAVE_BLUETOOTH := true

# Kernel
# mtd4 0x003fffff => boot
# mtd5 0x004fffff => recovery
# mtd7 0x0bdfffff => system
# mtd9  0x105c0000 => usrdata
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00800000 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x18aa0000 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x15e00000 
BOARD_FLASH_BLOCK_SIZE := 131072

# Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_MASS_STORAGE_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"

# Changes related to bootmenu
BOARD_USES_BOOTMENU := true
BOARD_BOOTMODE_CONFIG_FILE := /cache/recovery/bootmode.conf

# Keep old variables until system core patch is merged
#TARGET_RECOVERY_PRE_COMMAND := "/system/bootmenu/script/reboot_command.sh recovery"
#TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/begonia/recovery_ui.c
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_HAS_SMALL_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_NEVER_UMOUNT_SYSTEM := true
#TARGET_RECOVERY_UI_LIB := librecovery_ui_generic
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

# Begonia requires the common boot hijack
#TARGET_NEEDS_MOTOROLA_HIJACK := true

# Override cyanogen squisher to customize our update zip package
TARGET_CUSTOM_RELEASETOOL := ./device/motorola/begonia/releasetools/squisher


# In nighly builds only
#ifndef CYANOGEN_RELEASE

#BOARD_HAVE_FM_RADIO := true
#BOARD_FM_DEVICE := tiwlan0
#TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO

#endif

