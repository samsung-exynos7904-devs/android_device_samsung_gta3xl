#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from gta3xl-common
$(call inherit-product, device/samsung/gta3xl-common/common.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/gta3xl/gta3xl-vendor.mk)
