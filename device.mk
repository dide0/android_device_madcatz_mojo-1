#
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

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/madcatz/mojo/mojo-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/madcatz/mojo/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.mojo \
    init.mojo.rc \
    init.mojo.usb.rc \
    ueventd.mojo.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

# Audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    audio.primary.mojo \
    audio.r_submix.default \
    audio.usb.default \
    audio.a2dp.default \
    libaudiopolicymanager \
    audio_policy.default \
    audio.primary.default \
    libaudiopolicyservice \
    libaudiopolicymanagerdefault \
    libaudiospdif \
    libaudioutils \
    libaudioresampler \
    tinymix \
    tinycap

USE_CUSTOM_AUDIO_POLICY := 1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.cache-params=10240/20480/15 \
    persist.sys.media.avsync=true \
    media.aac_51_output_enabled=true

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# M.O.J.O.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/mojo_hardware.xml:system/etc/permissions/mojo_hardware.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml

PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_CHARACTERISTICS := tablet shield

PRODUCT_TAGS += dalvik.gc.type-precise

# HDMI
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Adb over TCP
PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Power
PRODUCT_PACKAGES += \
    power.mojo

#  OpenGL ES 2.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# EGL
PRODUCT_PACKAGES += \
    libdgv1

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
