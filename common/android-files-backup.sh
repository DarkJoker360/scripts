#!/bin/bash

#
# Simple script to backup android user files using adb.
#

device_name=$(adb shell getprop ro.product.system.device)

cd $HOME
mkdir $device_name-backup
cd $device_name-backup

for dirs in DCIM Documents Download Movies Music Pictures Recordings
do
    adb pull /sdcard/$dirs
done

zip -r '$device_name'_backup.zip .
