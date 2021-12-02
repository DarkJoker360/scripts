#!/usr/bin/env bash

# Copyright (C) 2020 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only

# Custom LineageOS OTA info generator

# Put this script to the device out folder to grab ota infos
DEVICE_CODENAME="$(pwd | xargs basename)"
LINEAGE_FILE=$(stat -c %n lineage*-UNOFFICIAL-$DEVICE_CODENAME.zip)
LINEAGE_VERSION=$(echo ${LINEAGE_FILE:8:4})
BUILD_DATE_PROP=$(cat system/build.prop | grep -i "ro.build.date.utc")
BUILD_DATE=$(echo ${BUILD_DATE_PROP:18:10})
ID=$(md5sum lineage*-UNOFFICIAL-$DEVICE_CODENAME.zip)
MD5=$(echo ${ID:0:32})
SIZE=$(stat -c %s lineage*-UNOFFICIAL-$DEVICE_CODENAME.zip)

printf "\n******** LineageOS ota info  ********\n\n"
echo "datetime: $BUILD_DATE"
echo "filename: $LINEAGE_FILE"
echo "id: $MD5"
echo "romtype: unofficial"
echo "url: -"
echo "version: $LINEAGE_VERSION"
echo "size: $SIZE"
printf "\n*******************************************************************"
echo "Update your json with the latest update info !"
printf "For any question about the json file formatting see:\nhttps://github.com/LineageOS/android_packages_apps_Updater/blob/lineage-17.1/README.md\n"
echo "*******************************************************************"
echo " "
echo "Made by DarkJoker360."