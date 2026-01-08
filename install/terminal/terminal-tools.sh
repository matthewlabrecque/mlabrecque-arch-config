#!/bin/bash
# The terminal tools shell file contains commonly used tools in the terminal that aren't directly used for development

# Yay package installer
if ! command -v yay &>/dev/null; then
  cd /tmp || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si --noconfirm
  cd || exit
else
  echo "Yay AUR helper is already installed, skipping installation"
fi
