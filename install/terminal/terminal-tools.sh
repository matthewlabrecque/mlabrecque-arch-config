#!/bin/bash
# The terminal tools shell file contains commonly used tools in the terminal that aren't directly used for development

# Yay package installer
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si -y

# Ghostty Terminal
sudo pacman -S --noconfirm ghostty

# Neovim
sudo pacman -S --noconfirm nvim

# Rsync
sudo pacman -S --noconfirm rsync
