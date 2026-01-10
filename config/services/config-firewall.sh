#!/bin/bash
set -e

# Configure UFW
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit ssh
sudo ufw --force enable
sudo ufw allow 53317 # Port 53317 is what is used by Localsend
