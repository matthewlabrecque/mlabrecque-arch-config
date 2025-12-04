#!/bin/bash

echo "Enabling Flathub repository due to having more up-to-date packages"
# Enable flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Run installer
echo "Installing terminal tools"
source install/terminal/terminal-tools.sh

echo "Installing desktop apps"
for installer in install/desktop/*; do
  source $installer
done

echo "Installing Sway TWM"
source install/sway-twm/dm-sway.sh

# Run configuration
echo "Running configuration scripts"
for config in config/*; do
  source $config
done

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
