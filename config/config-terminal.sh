#!/bin/bash

# Switch the default terminal to zsh
chsh -s $(which zsh)

# Add oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add starship to terminal
sudo pacman -S --noconfirm starship

# Append Ghostty configuration with addition parameters
mkdir -p ~/.config/ghostty
cat <<EOF >>~/.config/ghostty/config
#Shell configuration
command = $(which zsh)

#Font configuration
font-family = "FiraCode Nerd Font Mono"
font-size = 12
maximize = true
theme = Atom One Dark
EOF

# Append .zshrc file with additional parameters
cat <<EOF >>~/.zshrc
# Enable starship
eval "\$(starship init zsh)"

# Custom aliases
alias ll="ls -lF"
alias autoremove-check="sudo pacman -Rsp \$(pacman -Qdtq)"
alias autoremove="sudo pacman -Rs \$(pacman -Qdtq)"
alias n="nvim ."
EOF
