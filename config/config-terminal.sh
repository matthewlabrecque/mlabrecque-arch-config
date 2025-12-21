#!/bin/bash

# Switch the default terminal to zsh
chsh -s $(which zsh)

# Add starshp to terminal
curl -sS https://starship.rs/install.sh | sh

# Append Ghostty configuration with addition parameters
echo '#Shell configuration\n
command = /bin/bash\n
\n
#Font configuration\n
font-family = "FiraCode Nerd Font Mono\n
font-size = 12\n
maximize = true\n
theme = Atom One Dark' >>~/.config/ghostty/config

# Append .zshrc file with additional parameters
echo '# Enable starship\n
eval "$(starship init zsh)"\n
\n
# Custom aliases\n
alias ll="ls -lF"\n
alias autoremove-check="sudo pacman -Rsp $(pacman -Qdtq)"\n
alias autoremove="sudo pacman -Rs $(pacman -Qdtq)"\n
alias n="nvim ."' >>~/.zshrc
