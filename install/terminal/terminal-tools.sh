#!/bin/bash

# The terminal tools shell file contains commonly used tools in the terminal that aren't directly used for development

# Neovim
sudo pacman -S --noconfirm nvim

# Yay package installer
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si -y

# Ghostty Terminal
sudo pacman -S --noconfirm ghostty

# Rsync
sudo pacman -S --noconfirm rsync
