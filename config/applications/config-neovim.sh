#!/bin/bash
set -e

# Install LazyVim
if [ -d ~/.config/nvim ]; then
  echo "Backing up existing Neovim configuration..."
  mv ~/.config/nvim ~/.config/nvim.bak
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
