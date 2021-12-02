#!/usr/bin/env bash
#
# ROM  building script
#
# Copyright (C) 2018 DarkJoker360
# 
# This program is free software: you can REDistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
source build/envsetup.sh
echo ""
echo "#############"
echo "# REPO INIT #"
echo "#############"
echo "Initializate Repo?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) time repo init -u git://github.com/LineageOS/android.git -b cm-14.1; break;;
        No ) break;;
    esac
done


echo ""
echo "#############"
echo "# REPO SYNC #"
echo "#############"
echo "Sync Repo?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) time repo sync; break;;
        No ) break;;
    esac
done

###############
# CLONE REPOS #
###############
echo "Do you want to clone P8 Lite repos?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )   git clone https://github.com/DarkJoker360/android_device_huawei_alice -b cm-14.1 device/huawei/alice
                git clone https://github.com/DarkJoker360/android_vendor_huawei_alice -b cm-14.1 vendor/huawei/alice
                git clone https://github.com/DarkJoker360/android_kernel_huawei_alice -b cm-14.1 kernel/huawei/alice
                cd bionic/libc/bionic && git remote add gps https://github.com/DarkJoker360/android_bionic && git fetch gps && git cherry-pick 05f2b6707a50edbf1cd60dee1b107992b42964b0
                cd ../../.. && cd system/bt && git remote add bt https://github.com/DarkJoker360/android_system_bt && git fetch bt && git cherry-pick 46c163e13dbe21476e3fe8e2f94ae10af28f2c5c
                cd ../.. && cd frameworks/native && git remote add hwc https://github.com/DarkJoker360/android_frameworks_native && git fetch hwc && git cherry-pick a083e29978432dfc04039a224c82925cbcab780f
                cd .. && cd opt/telephony  && git remote add sim https://github.com/DarkJoker360/android_frameworks_opt_telephony && git fetch sim && git cherry-pick 79b503f625a7c0a048f9c891e19cc6be4b2f0e57
                cd ../../.. && cd packages/apps/Nfc && git remote add nfc https://github.com/DarkJoker360/android_packages_apps_Nfc && git fetch nfc && git cherry-pick 2834f10f19ad0f232eaa6e2448bf11ead96fa3fb && git cherry-pick 3520f5b2f74a0b4fdafaa95c985cd38ecb6a6ff8 && cd ../../..; break;;
        No ) break;;
    esac
done

###############
# BUILD  ROM  #
###############
echo "Do you want to build the rom for P8 Lite?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )   . build/envsetup.sh
		        lunch lineage_alice-userdebug
				mka bacon; break;;
        No ) break;;
    esac
done

echo ""
echo "Now you can enjoy your rom :D !"
