#!/bin/bash
set -euo pipefail

# Prompt the user for their password
sudo -v

# Sudo "keep alive" script
# We might have to change this to the sledgehammer method if it fails
# See https://github.com/reitermarkus/dotfiles/blob/f104a8a7a592204a66646810ae8fbd956023c988/.sh#L43-L60
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Check that system is running Arch, and abort if not
if [ ! -f /etc/arch-release ]; then
  echo "FATAL ERROR: This system is not running Arch Linux."
  exit 1
fi

# Enable nullglob to prevent loops from running with literal glob strings if directories are empty
shopt -s nullglob

# Determine the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Enable flathub repository
echo "Enabling Flatpak"
sudo pacman -S --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update the system before continuing
sudo pacman -Syu --noconfirm

##### INSTALLATION SCRIPTS #####

# Install LTS Kernel
echo "Installing LTS kernel"
source "$SCRIPT_DIR/install/kernel/lts-kernel.sh"

# Install terminal tools and toolchains
echo "Installing terminal tools"
for installer in "$SCRIPT_DIR/install/terminal/"*; do
  if [ -x "$installer" ]; then
    "$installer"
  else
    bash "$installer"
  fi
done

# Install services
echo "Installing Linux services"
for installer in "$SCRIPT_DIR/install/services/"*; do
  if [ -x "$installer" ]; then
    "$installer"
  else
    bash "$installer"
  fi
done

# Install non-DE specific applications
echo "Installing desktop apps"
for installer in "$SCRIPT_DIR/install/applications/"*; do
  if [ -x "$installer" ]; then
    "$installer"
  else
    bash "$installer"
  fi
done

# Install COSMIC desktop environment
echo "Installing COSMIC desktop environment"
source "$SCRIPT_DIR/install/de/de-cosmic.sh"

##### CONFIGURATION SCRIPTS #####

# Configure LTS kernel as default
echo "Configuring Arch to use LTS kernel"
for config in "$SCRIPT_DIR/config/kernel/"*; do
  if [ -x "$config" ]; then
    "$config"
  else
    bash "$config"
  fi
done

# Configure services
echo "Configuring services"
for config in "$SCRIPT_DIR/config/services/"*; do
  if [ -x "$config" ]; then
    "$config"
  else
    bash "$config"
  fi
done

# Configure terminal
echo "Configuring terminal"
for config in "$SCRIPT_DIR/config/terminal/"*; do
  if [ -x "$config" ]; then
    "$config"
  else
    bash "$config"
  fi
done

# Configure applications
echo "Configuring applications"
for config in "$SCRIPT_DIR/config/applications/"*; do
  if [ -x "$config" ]; then
    "$config"
  else
    bash "$config"
  fi
done

# Desktop
echo "Starting display manager, change will take place after reboot"
sudo systemctl enable cosmic-greeter.service

echo "Installation/Configuration succesful!"
for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
