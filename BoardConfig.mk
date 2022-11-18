#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/gta3xl

# Inherit from gta3xl-common
include device/samsung/gta3xl-common/BoardConfigCommon.mk

# Include proprietary files
-include vendor/samsung/gta3xl/BoardConfigVendor.mk
