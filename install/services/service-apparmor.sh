#!/bin/bash
set -e

# AppArmor is a Mandatory-Access-Control (MAC) system which implements Linux Security Modules
# The choice to implement AppArmor over SELinux is that AppArmor is officially supported by Arch, while SELinux is not

sudo pacman -S --noconfirm apparmor
