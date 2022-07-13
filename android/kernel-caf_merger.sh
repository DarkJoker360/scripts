#!/usr/bin/env bash

#
# Copyright (C) 2021 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only
#

#
# Kernel caf tag merger
# INPUT: Caf tag (ex: LA.UM.9.11.r1-03900-NICOBAR.0)
#

if [ "$1" == "" ]; then
    echo "No tag specified, aborting."
    exit 0;
fi

TAG="$1"

fail () {
    echo "Merge failed, aborting."
    exit 1
}

echo "Merging tag $TAG ..."
git fetch https://git.codelinaro.org/clo/la/kernel/msm-4.14 $TAG 
git merge FETCH_HEAD || fail

git fetch https://git.codelinaro.org/clo/la/platform/vendor/opensource/audio-kernel/ $TAG 
git merge FETCH_HEAD || fail

for i in qcacld-3.0 qca-wifi-host-cmn fw-api; do
    git fetch https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/$i $TAG
    git merge FETCH_HEAD -X subtree=drivers/staging/$i || fail
done

echo "Done"
