#!/bin/bash

# Change shell to ZSH
chsh -s "$(which zsh)"

# Set color theme to Nord
cd /tmp || exit
git clone https://github.com/nordtheme/gnome-terminal.git
cd gnome-terminal/src || exit
source nord.sh
cd ~ || exit

# Install Starship
curl -sS https://starship.rs/install.sh | sh
echo "eval \"$(starship init zsh)\"" >>~/.zshrc
