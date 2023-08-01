#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from gta3xl device
$(call inherit-product, device/samsung/gta3xl/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gta3xl
PRODUCT_NAME := lineage_gta3xl
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T515
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gta3xlxx-user 11 RP1A.200720.012 T515XXU8CVL1 release-keys"

BUILD_FINGERPRINT := samsung/gta3xlxx/gta3xl:11/RP1A.200720.012/T515XXU8CVL1:user/release-keys
