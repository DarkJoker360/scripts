#!/usr/bin/env bash

#
# Copyright (C) 2021 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only
#

#
# Simple script for changing icon packs to AOSP
#

CMD="enable"

if [ "$1" == "" ]; then
    echo "No args specified, aborting."
    exit 0;
fi

case $1 in
    -h |--help)
      printf "Simple script for changing icon pack to AOSP (Like theme picker does)\nUsage:\n\tbash aosp-icon_pack-theming.sh icon_pack-name\n"
    ;;
    -d | --disable | --default) # Disable all icon packs and use default one
      CMD="disable"
      # If you are using Android 10 remove kai,sam,victor
      for icon_pack in circular filled rounded kai sam victor
      do
        for targets in android systemui settings
        do
            adb shell cmd overlay $CMD com.android.theme.icon_pack.$icon_pack.$targets
        done
      done
    ;;
    *)
      ICON_PACK=$1
      for targets in android systemui settings
      do
          adb shell cmd overlay $CMD com.android.theme.icon_pack.$ICON_PACK.$targets
      done
    ;;
esac



