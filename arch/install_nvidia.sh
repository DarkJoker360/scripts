#!/usr/bin/env bash

sudo pacman -Sy nvidia nvidia-settings

#Stuff for people with a integrated + dedicated GPU
read -e -p "Do you have Intel integrated GPU and discrete NVIDIA GPU? [y/n]: " input
if [[ "$input" =~ ^[Yy]$ ]]; then
sudo pacman -S gdm-prime optimus-manager

sudo sed -i "s;#WaylandEnable=false;WaylandEnable=false;g" /etc/gdm/custom.conf
sudo systemctl enable optimus-manager.service
sudo systemctl start optimus-manager.service

echo "Adding PCI Power Control config for better power management..."
sudo echo "[optimus]" > /etc/optimus-manager/optimus-manager.conf
sudo echo "switching=none" >> /etc/optimus-manager/optimus-manager.conf
sudo echo "pci_power_control=yes" >> /etc/optimus-manager/optimus-manager.conf
sudo echo "pci_remove=yes" >> /etc/optimus-manager/optimus-manager.conf
sudo echo "pci_reset=no" >> /etc/optimus-manager/optimus-manager.conf
fi

cd /usr/share/nvidia
sudo ln -s nvidia-application-profiles-*-key-documentation nvidia-application-profiles-key-documentation
cd ../../..

echo "Nvidia drivers are now correctly installed."
