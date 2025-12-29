#!/bin/bash

# Enable the libvirt daemon
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt "$USER"
