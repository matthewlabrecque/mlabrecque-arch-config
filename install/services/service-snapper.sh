#!/bin/bash
set -e

# Snapper is a utility for creating system snapshots for easy rollback of updates if something breaks
sudo pacman -S --noconfirm snapper
