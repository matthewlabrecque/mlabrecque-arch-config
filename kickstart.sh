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

# Define Error Log File and Tracking Array
ERROR_LOG="$HOME/Desktop/install_errors.txt"
rm -f "$ERROR_LOG" # Clear previous logs
declare -a FAILED_INSTALLS=()

# Function to extract program name from filename
get_script_name() {
    local filename
    filename=$(basename "$1" .sh)
    # Strip common prefixes
    filename=${filename#app-}
    filename=${filename#config-}
    filename=${filename#service-}
    filename=${filename#terminal-}
    filename=${filename#de-}
    filename=${filename#lts-}
    echo "$filename"
}

# Wrapper to run scripts, handle errors, and manage dependencies
run_script() {
    local script="$1"
    local action="$2" # "install" or "configure"
    local name
    name=$(get_script_name "$script")

    # If configuration, check if the corresponding installation failed
    if [ "$action" == "configure" ]; then
        for failed in "${FAILED_INSTALLS[@]}"; do
            if [ "$failed" == "$name" ]; then
                # Skip configuration silently if installation failed
                return 0
            fi
        done
    fi
    
    if [ ! -f "$script" ]; then
        return 0
    fi

    # Execute script with bash
    if ! bash "$script"; then
        echo "FAILED: $action $name"
        echo "failed to $action $name" >> "$ERROR_LOG"
        
        if [ "$action" == "install" ]; then
            FAILED_INSTALLS+=("$name")
        fi
    fi
}

# Enable flathub repository
echo "Enabling Flatpak"
sudo pacman -S --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update the system before continuing
sudo pacman -Syu --noconfirm

##### INSTALLATION SCRIPTS #####

# Install LTS Kernel
echo "Installing LTS kernel"
run_script "$SCRIPT_DIR/install/kernel/lts-kernel.sh" "install"

# Install terminal tools and toolchains
echo "Installing terminal tools"
for installer in "$SCRIPT_DIR/install/terminal/"*; do
  run_script "$installer" "install"
done

# Install services
echo "Installing Linux services"
for installer in "$SCRIPT_DIR/install/services/"*; do
  run_script "$installer" "install"
done

# Install non-DE specific applications
echo "Installing desktop apps"
for installer in "$SCRIPT_DIR/install/applications/"*; do
  run_script "$installer" "install"
done

# Install COSMIC desktop environment
echo "Installing COSMIC desktop environment"
run_script "$SCRIPT_DIR/install/de/de-cosmic.sh" "install"

##### CONFIGURATION SCRIPTS #####

# Configure LTS kernel as default
echo "Configuring Arch to use LTS kernel"
for config in "$SCRIPT_DIR/config/kernel/"*; do
  run_script "$config" "configure"
done

# Configure services
echo "Configuring services"
for config in "$SCRIPT_DIR/config/services/"*; do
  run_script "$config" "configure"
done

# Configure terminal
echo "Configuring terminal"
for config in "$SCRIPT_DIR/config/terminal/"*; do
  run_script "$config" "configure"
done

# Configure applications
echo "Configuring applications"
for config in "$SCRIPT_DIR/config/applications/"*; do
  run_script "$config" "configure"
done

# Desktop
echo "Starting display manager, change will take place after reboot"
sudo systemctl enable cosmic-greeter.service

if [ -f "$ERROR_LOG" ]; then
    echo "Installation finished with errors. See $ERROR_LOG on your desktop."
else
    echo "Installation/Configuration successful!"
fi

for i in {5..1}; do
  echo "Rebooting system in $i seconds!"
  sleep 1
done
systemctl reboot
