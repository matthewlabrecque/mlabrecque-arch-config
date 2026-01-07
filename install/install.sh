#!/bin/bash

# Kernel
echo "Installing LTS kernel"
source kernel/lts-kernel.sh

# Terminal tools and toolchains
echo "Installing terminal tools"
for installer in terminal/*; do
  source $installer
done

# Install services such as UFW and AppArmor
echo "Installing services"
for installer in services/*; do
  source $installer
done

# Install non-DE specific applications
echo "Installing desktop apps"
for installer in applications/*; do
  source $installer
done

# Desktop environment
echo "Installing COSMIC desktop environment"
source de/de-cosmic.sh
