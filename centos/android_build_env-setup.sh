#!/bin/bash

#
# Copyright (C) 2021 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only
#

#
# Android build env setup script for CentOS
#

sudo yum -y update
sudo yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.9-1.x86_64.rpm

sudo yum -y install bison build-essential curl flex git gnupg gperf liblz4-tool libncurses5-dev wget \
    libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop maven pngcrush schedtool squashfs-tools \
    xsltproc zip repo openjdk-8-jdk bc ccache automake unzip zlib1g-dev g++-multilib python-networkx \
    libbz2-dev libbz2-1.0 libghc-bzlib-dev bzip2 dpkg-dev make optipng gcc-multilib lib32ncurses5-dev \
    lib32readline6-dev lib32z1-dev java-1.7.0-openjdk java-1.7.0-openjdk-devel glibc.i686 libstdc++.i686 \
    patch

wget https://raw.githubusercontent.com/DarkJoker360/scripts/master/common/repo.sh