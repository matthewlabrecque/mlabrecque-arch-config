#!/bin/bash

# Clone git repo with configuration files
cd /tmp || exit
git clone https://codeberg.org/mhlab/dotfiles.git
cd dotfiles || exit

# Copy configuration files for Sway to proper directory locations
mkdir ~/.config/fuzzel mako sway swaylock waybar     # Create target directories
cp fuzzel.ini ~/.config/fuzzel/fuzzel.ini            # Fuzzel menu
cp sway_config ~/.config/sway/config                 # Sway TWM config
cp power_menu.xml ~/.config/waybar/power_menu.xml    # Waybar power menu
cp waybar_config.jsonc ~/.config/waybar/config.jsonc # Waybar config
cp waybar_style.css ~/.config/waybar/style.css       # Waybar styling
