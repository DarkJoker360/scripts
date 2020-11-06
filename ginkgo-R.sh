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

./vendor/lineage/build/tools/repopick.py -t eleven-qti-bt-stack # QTI BT stack
