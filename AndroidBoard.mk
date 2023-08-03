#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

MKDTIMG    := $(HOST_OUT_EXECUTABLES)/mkdtimg$(HOST_EXECUTABLE_SUFFIX)
KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ
DTB_DIR    := $(KERNEL_OUT)/arch/$(TARGET_KERNEL_ARCH)/boot/dts/exynos
DTB_CFG    := $(COMMON_PATH)/configs/kernel/exynos7885.cfg

INSTALLED_DTBIMAGE_TARGET := $(PRODUCT_OUT)/dtb.img

$(INSTALLED_DTBIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(MKDTIMG) $(AVBTOOL)
	$(hide) echo "Building dtb.img"
	$(hide) $(MKDTIMG) cfg_create $@ $(DTB_CFG) -d $(DTB_DIR)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_DTBIMAGE_PARTITION_SIZE),raw)
	$(hide) $(AVBTOOL) add_hash_footer \
	  --image $@ \
	  --partition_size $(BOARD_DTBIMG_PARTITION_SIZE) \
	  --partition_name dtb \
	  --algorithm $(BOARD_AVB_ALGORITHM) \
	  --key $(BOARD_AVB_KEY_PATH)

.PHONY: dtbimage
dtbimage: $(INSTALLED_DTBIMAGE_TARGET)

INSTALLED_RADIOIMAGE_TARGET += $(INSTALLED_DTBIMAGE_TARGET)
