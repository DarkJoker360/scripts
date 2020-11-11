#!/usr/bin/env bash

#
# ginkgo utility for Android 11
#

BRANCH="lineage-18.0"

# Hals
rm -rf hardware/qcom-caf/sm8150/display && git clone https://github.com/DarkJoker360/android_hardware_qcom_display -b $BRANCH hardware/qcom-caf/sm8150/display
rm -rf hardware/qcom-caf/sm8150/media && git clone https://github.com/DarkJoker360/android_hardware_qcom_media -b $BRANCH hardware/qcom-caf/sm8150/media
rm -rf hardware/qcom-caf/sm8150/audio && git clone https://github.com/DarkJoker360/android_hardware_qcom_audio -b $BRANCH hardware/qcom-caf/sm8150/audio

. build/envsetup.sh

# QTI BT stack
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_bluetooth-commonsys-intf -b $BRANCH vendor/qcom/opensource/commonsys-intf/bluetooth
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_bluetooth_ext -b $BRANCH vendor/qcom/opensource/commonsys/bluetooth_ext
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_system_bt -b $BRANCH vendor/qcom/opensource/commonsys/system/bt
git clone https://github.com/LineageOS/android_vendor_qcom_opensource_packages_apps_Bluetooth -b $BRANCH vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
repopick -t "eleven-qti-bt-stack" 
