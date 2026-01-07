#!/bin/bash

# Switch the default terminal to zsh
chsh -s "$(which zsh)"

# Add oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add starship to terminal
sudo pacman -S --noconfirm starship

# Append .zshrc file with additional parameters
cat <<EOF >>~/.zshrc
# Add JAVA to the home directory path
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# Enable starship
eval "\$(starship init zsh)"

# Custom aliases
alias ll="ls -lF"
alias autoremove-check="sudo pacman -Rsp \$(pacman -Qdtq)"
alias autoremove="sudo pacman -Rs \$(pacman -Qdtq)"
alias n="nvim ."
EOF

source ~/.zshrc
