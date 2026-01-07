#!/bin/bash

# Kernel
echo "Configuring Arch to use LTS kernel"
for config in kernel/*; do
  source $config
done

# Services
echo "Configuring services"
for config in services/*; do
  source $config
done

# Terminal
echo "Configuring terminal"
for config in terminal/*; do
  source $config
done

# Applications
echo "Configuring applications"
for config in applications/*; do
  source $config
done

# Desktop
sudo systemctl enable --now cosmic-greeter.service
