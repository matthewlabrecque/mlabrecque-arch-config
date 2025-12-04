#!/bin/bash

echo "Enabling Flathub repository due to having more up-to-date packages"
# Enable flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Ask user if they want to install Sway TWM
read -rp "By default, this script will install the Sway TWM as a secondary desktop, do you want Sway installed [y/N]?" USER_INPUT
if [ "$USER_INPUT" == "y" ] || [ "$USER_INPUT" == "Y" ]; then
  echo "Installing Sway TWM"
  source sway-twm/dm-sway.sh
fi

# Run configuration
echo "Installing terminal tools"
source install/terminal/terminal-tools.sh

echo "Installing desktop apps"
for installer in install/desktop/*; do
  source $installer
done

echo "Running configuration scripts"
