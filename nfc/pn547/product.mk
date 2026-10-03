#
# Copyright (C) 2018 The LineageOS Project
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

# NFC
$(call inherit-product, device/samsung/msm8974-common/nfc/product.mk)

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl

# PN547 のファームウェアの版はチップの系統ごとに異なり、HAL は同梱の版がチップと異なると書き換えを試みる。
# 既定は Galaxy S5 の版（01.1F）をソースからビルドし、異なる系統のチップを持つ機種は自身の版を同梱する。
ifneq ($(TARGET_PROVIDES_PN547_FW),true)
PRODUCT_PACKAGES += \
    libpn547_fw
endif

PRODUCT_COPY_FILES += \
    device/samsung/msm8974-common/nfc/pn547/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    device/samsung/msm8974-common/nfc/pn547/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    vendor/samsung/klte-common/proprietary/vendor/lib/hw/nfc_nci.msm8974.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/nfc_nci.msm8974.so
