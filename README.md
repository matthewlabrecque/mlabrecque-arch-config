# mlabrecque Arch Autoconfig Utility

An opinionated autoconfiguration script for Arch Linux that turns a fresh Arch Linux installation into a setup tailored to my personal preferences as a Computational Mathematics student who enjoys programming as a hobby.

## Features
- Installs a curated set of packages and AUR helpers (using `yay`)
- Configures **UFW** as the system firewall
- Enables and sets up **AppArmor** profiles for enhanced security
- Sets up a complete development environment for:
  - Python
  - Go
  - Rust
  - C/C++
- Installs and configures:
  - **Ghostty** as the terminal emulator
  - **Zsh** as the default shell (with Oh My Zsh, Starship, and custom plugins)
  - **Neovim** as the primary text editor (with a pre-configured setup including plugins)
  - **Zen** as the default web browser
- Installs additional productivity and utility programs:
  - Anki (flashcard studying)
  - LibreOffice
  - OBS Studio
  - Telegram Desktop
  - And more...

## Warning
This script is **extremely opinionated** and will make significant changes to your system, including:
- Overwriting configuration files (dotfiles for Neovim, Zsh, etc.)
- Enabling system services (UFW, AppArmor)
- Changing your default shell

**Use at your own risk.** This is not intended as a general-purpose Arch setup script.

## Requirements
- A fresh Arch Linux installation (I recommend installing using the `archinstall` command.
- Run as a non-root user with `sudo` privileges
- Booted into a working base Arch system (after initial installation and reboot) with a desktop environment (GNOME or KDE)

## Usage
1. Clone the repository:
```bash
git clone https://codeberg.org/mlabrecque/mlabrecque-arch-autoconfig.git
cd mlabrecque-arch-autoconfig
```

2. Make the script executable:
```bash
chmod +x autoconfig.sh
```

3. Run the script:
```bash
./autoconfig.sh
```

## Post-Installation
After the script executes and reboots your computer:
- Your default shell should be Zsh
- Ghostty should be available as your terminal
- Neovim should launch with the full plugin configuration
- Zen Browser should be installed and ready
- UFW and AppArmor should be active
