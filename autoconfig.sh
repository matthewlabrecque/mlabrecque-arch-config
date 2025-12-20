#!/bin/bash
set -euo pipefail

# Check that system is running Arch
if [ ! -f /etc/arch-release ]; then
  echo "FATAL ERROR: This system is not running Arch Linux."
  exit 1
fi

# Check that the KDE desktop environment is installed
# If it isn't, warn the user that some scripts may not work as intended
# If no desktop environment exists, abort
if [ -z "$XDG_CURRENT_DESKTOP" ]; then
  echo "FATAL ERROR: No desktop environment is installed. Please install one to continue with installation (KDE recommended)."
  exit 1
elif [ "$XDG_CURRENT_DESKTOP" != "KDE"]; then
  echo "Warning! This system is not running KDE Desktop Environment, some packages may not work as expected."
  read -p "Press enter to continue"
else
  echo "Arch with KDE detected. Proceeding with installation."
fi

echo "Enabling Flathub repository due to having more up-to-date packages"

# Enable flathub repository
sudo pacman -S --noconfirm flatpak

# Update the system before continuing
sudo pacman -Syu --noconfirm

# Run installer
echo "Installing terminal tools"
source install/terminal/terminal-tools.sh

echo "Installing dev toolchains and supporting packages"
source install/terminal/dev-tools.sh

echo "Installing desktop apps"
for installer in install/desktop/*; do
  source $installer
done

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
