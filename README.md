# mlabrecque Arch Autoconfig Utility

## Overview
My custom script which turns a minimal Arch Linux installation into a fully featured environment designed for my specific workflow and preferences as a Computer Science and Math student at university.

## Philosophy
In the spirit of Arch Linux's core philosophy of keeping things minimal as possible, I have striven for simplicity/minimalism and designed my script to hit the sweet spot of delivering a secure and stable system, while also not sacrificing anything in terms of my workflow or ease of use. This philosophy did make for intentional decisions in what programs I use and don't use in my workflows, as some might notice my intentional snub of a more "conventional" IDE or text editor (such as VSCode or JetBrains) in place of using Neovim. The truth is if I feel like a program gets in my way, then there's a better option out there and it felt like VSC/IntelliJ were doing more to get in my way than help me, which prompted the exclusion from my system.

Currently to do a full build of Arch using this script requires a total of 808 packages (775 from pacman, 33 from Flatpak). In comparison to a conventional setup with KDE or GNOME where that number is closer to between 900 and 1,100 packages. However, as you will see this minimalism doesn't lose anything when it comes to features.

## Features
- Sets up and configures **COSMIC** as the default desktop envrionment
- Installs a curated set of packages and AUR helpers (using `yay`)
- Configures **UFW** as the system firewall
- Enables and sets up **AppArmor** profiles for enhanced security
- Sets up a complete development environment for:
  - Python
  - Go
  - Java
  - Rust
  - C/C++
- Installs and configures:
  - **Zsh** as the default shell (with Oh My Zsh, Starship, and custom plugins)
  - **Neovim** as the primary text editor (with a pre-configured setup including plugins)
  - **Brave** as the default web browser
- Installs additional programs and utilities such as:
  - Anki (flashcard studying)
  - LibreOffice
  - OBS Studio
  - Telegram Desktop
  - btrfs Assistant
  - And more...

## Requirements
- A fresh Arch Linux installation (I recommend a minimal installation using the `archinstall` command).
- A user account which is non-root (this is set up as part of `archinstall`)

## Post-Installation
After the script executes and reboots your computer:
- Your default shell should be Zsh
- Neovim should launch with the full plugin configuration
- Brave Browser should be installed and ready
- UFW and AppArmor should be active

## Future Features
- Auto configuration of COSMIC with wallpapers, keyboard shortcuts, and plugins
- Potential to make this a standalone ISO image for a preconfigured Arch system

## Usage Policy
This code is free to use for hobbyists. I do not consent to the use of any part of this codebase for training any form of machine learning model, including artificial intelligence. Note that I do not provide any warranty with this script; please **USE WITH CAUTION**. I am not responsible if you blow up a system using this script.
