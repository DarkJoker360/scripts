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

printf "\n******** LineageOS ota info  ********\n\n\n"

echo '{
  "response": [
    {
      "datetime": '$BUILD_DATE',
      "filename": "'$LINEAGE_FILE'",
      "id": "'$MD5'",
      "romtype": "unofficial",
      "size": '$SIZE',
      "url": "-",
      "version": "'$LINEAGE_VERSION'"
    }
  ]
}'

if [[ "$1" == "-o" || "$1" == "--output-file" ]]; then
    output_file="lineage_$DEVICE_CODENAME.json"

    if [ "$2" != "" ]; then
        output_file=$2
    fi

    echo '{
    "response": [
        {
        "datetime": '$BUILD_DATE',
        "filename": "'$LINEAGE_FILE'",
        "id": "'$MD5'",
        "romtype": "unofficial",
        "size": '$SIZE',
        "url": "-",
        "version": "'$LINEAGE_VERSION'"
        }
    ]
    }' > $output_file
fi

printf "\n\n*******************************************************************"
echo "Update your json with the latest update info !"
printf "For any question about the json file formatting see:\nhttps://github.com/LineageOS/android_packages_apps_Updater/blob/lineage-17.1/README.md\n"
echo "*******************************************************************"
echo " "
echo "Made by DarkJoker360."