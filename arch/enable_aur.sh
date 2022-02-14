#!/bin/bash

#
# Simple script to enable AUR helper.
# by Simone Esposito (simoespo159@gmail.com)
#

sudo pacman -Sy --needed git base-devel

echo "Installing yay AUR helper"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Syu
sudo pacman -Syu

echo "Installing chaotic AUR repos"
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
sudo pacman -Syu
