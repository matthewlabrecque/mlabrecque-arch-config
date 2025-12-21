#!/bin/bash
set -euo pipefail

# Check that system is running Arch, and abort if not
if [ ! -f /etc/arch-release ]; then
  echo "FATAL ERROR: This system is not running Arch Linux."
  exit 1
fi

# Determine if KDE or GNOME is installed
# If neither are installed, abort installation
if [ "$XDG_CURRENT_DESKTOP" == "GNOME"]; then
  echo "GNOME desktop environment detected. Installing GNOME-specific packages."
  source install/desktop-environment/de-gnome.sh
elif [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
  echo "KDE desktop environment detected. Installing KDE-specific packages"
  source install/desktop-environment/de-kde.sh
else
  echo "FATAL ERROR: No desktop environment is installed. Please install one to continue with installation."
  exit 1
fi

sleep 5

# Enable flathub repository
echo "Enabling Flatpak"
sudo pacman -S --noconfirm flatpak

# Update the system before continuing
sudo pacman -Syu --noconfirm

# Install terminal tools
echo "Installing terminal tools"
source install/terminal/terminal-tools.sh

# Install dev tools/toolchains
echo "Installing dev tools"
source install/termina/dev-tools.sh

# Install services such as UFW and AppArmor
echo "Installing core services"
for installer in install/services/*; do
  source $installer
done

# Install non-DE specific applications
echo "Installing desktop apps"
for installer in install/desktop/*; do
  source $installer
done

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
