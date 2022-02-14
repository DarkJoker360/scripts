#!/bin/bash

#
# Simple script to install Cinnamon DE.
# by Simone Esposito (simoespo159@gmail.com)
#

sudo pacman -Sy cinnamon system-config-printer gnome-keyring gnome-terminal blueman \
                metacity lightdm lightdm-gtk-greeter

sudo systemctl enable lightdm
