#!/usr/bin/env bash

#
# Setup script for NativeScript linux-android
#

if (( $EUID != 0 )); then
    echo "You need to run this script as root. Exiting..."
    exit
fi

dpkg --add-architecture i386
apt-get update && sudo apt-get upgrade -y
apt-get install lib32z1 lib32ncurses-dev libbz2-1.0:i386 libstdc++6:i386
apt-get install g++
apt-get install openjdk-8-jdk
echo 'export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')' >> ~/.bashrc
mkdir -p /usr/local/android/sdk/cmdline-tools && cd /usr/local/android/sdk/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip .
unzip commandlinetools-linux-6609375_latest.zip && rm commandlinetools-linux-6609375_latest.zip
echo 'export ANDROID_HOME="/usr/local/android/sdk/"' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT="/usr/local/android/sdk/"' >> ~/.bashrc
echo 'export PATH="${PATH}:${ANDROID_SDK_ROOT}cmdline-tools/tools/:${ANDROID_SDK_ROOT}platform-tools/"' >> ~/.bashrc
source ~/.bashrc
$ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager "tools" "emulator" "platform-tools" "platforms;android-28" "build-tools;28.0.3" "extras;android;m2repository" "extras;google;m2repository"
npm install nativescript -g --unsafe-perm
