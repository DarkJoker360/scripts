#!/bin/bash

#
# Simple script to fix bluetooth not turning on.
# by Simone Esposito (simoespo159@gmail.com)
#

if [ "$EUID" -ne 0 ] 
then 
  echo "ERROR: You need to run this script as root."
  exit 1
fi

pacman -S bluez
systemctl enable bluetooth.service
systemctl start bluetooth.service

echo "Done."
