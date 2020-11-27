#!/usr/bin/env bash

#
# ginkgo utility for Android 11
#

BRANCH="lineage-18.0"

# Hals
rm -rf hardware/qcom-caf/sm8150/display && git clone https://github.com/DarkJoker360/android_hardware_qcom_display -b $BRANCH hardware/qcom-caf/sm8150/display

cd device/xiaomi/sm6125-common
wget https://gist.githubusercontent.com/DarkJoker360/7424652e1205268d0c1b4afa48720202/raw/20c7a67087afb08aaf654a9748c596c72a8ace1a/0001-DNM-sm6125-common-Drop-in-tree-display-hal.patch
git apply 0001-DNM-sm6125-common-Drop-in-tree-display-hal.patch
cd ../../..

. build/envsetup.sh
