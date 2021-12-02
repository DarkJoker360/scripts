#!bin/bash

#
# Copyright (C) 2021 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only
#

#
# Script for importing caf drivers into a kernel
#

if [ "$1" == "" ]; then
    echo "No tag specified, aborting."
    exit 0;
fi

echo "Caf Tag: $1 "
echo "Importing drivers..."

git subtree add -P techpack/audio https://source.codeaurora.org/quic/la/platform/vendor/opensource/audio-kernel $1
git subtree add -P drivers/staging/qcacld-3.0 https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $1
git subtree add -P drivers/staging/qca-wifi-host-cmn https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $1
git subtree add -P drivers/staging/fw-api https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/fw-api $1

if [[ "$2" == "-p" || "$2" == "--push" ]]; then
    echo "Pushing changes to github..."
    git push
fi

echo "Done"
