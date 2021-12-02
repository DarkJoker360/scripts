#!/bin/bash

#
# Simple script to install yay AUR helper.
# by Simone Esposito (simoespo159@gmail.com)
#

if [ "$EUID" -ne 0 ] 
then 
  echo "ERROR: You need to run this script as root."
  exit 1
fi

pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
