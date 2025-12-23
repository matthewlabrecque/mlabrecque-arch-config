#!/bin/bash

# Snapper is a utility for creating system snapshots for easy rollback of updates if something breaks
# I also install the btrfs-assistant to enable a GUI front end for snapshots
sudo pacman -S --noconfirm snapper btrfs-assistant
