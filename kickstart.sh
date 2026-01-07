#!/bin/bash
set -euo pipefail

# Check that system is running Arch, and abort if not
if [ ! -f /etc/arch-release ]; then
  echo "FATAL ERROR: This system is not running Arch Linux."
  exit 1
fi

# Enable flathub repository
echo "Enabling Flatpak"
sudo pacman -S --noconfirm flatpak

# Update the system before continuing
sudo pacman -Syu --noconfirm

# Install system
echo "Installing system"
source install/install.sh

# Run configuration utility
echo "Configuring system"
source config/config.sh

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
