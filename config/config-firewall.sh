#!/bin/bash

# Install UFW
sudo pacman -S --noconfirm ufw

# Configure UFW
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
