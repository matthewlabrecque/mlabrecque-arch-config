#!/bin/bash

# Install dependencies for Virt-Manager
sudo pacman -S --noconfirm qemu libvirt iptables-nft dnsmasq

# Install Virt-Manager
sudo pacman -S --noconfirm virt-manager
