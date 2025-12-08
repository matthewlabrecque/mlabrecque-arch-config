#!/bin/bash
set -euo pipefail

echo "Enabling Flathub repository due to having more up-to-date packages"
# Enable flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Remove Fedora flatpak repo (This is done as Fedora repo is much more dated versus Flathub)
flatpak remote-delete fedora -y

# Run installer
echo "Installing terminal tools"
source install/terminal/terminal-tools.sh

echo "Installing desktop apps"
for installer in install/desktop/*; do
  source $installer
done

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
