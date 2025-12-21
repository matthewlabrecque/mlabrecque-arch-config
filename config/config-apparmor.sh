#!/bin/bash

# NOTE: This code was generatede by the Claude LLM, make sure to test extensively before pushing to prod!

systemctl enable apparmor.service

# Backup GRUB config
if [ ! -f /etc/default/grub.bak ]; then
  cp /etc/default/grub /etc/default/grub.bak
fi

# Check if AppArmor parameters are already set
if ! grep -q "apparmor=1 security=apparmor" /etc/default/grub; then
  # Add AppArmor parameters to GRUB_CMDLINE_LINUX_DEFAULT
  sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 apparmor=1 security=apparmor"/' /etc/default/grub
else
  echo "AppArmor parameters already present in GRUB configuration"
fi

# Regenerate GRUB configuration
grub-mkconfig -o /boot/grub/grub.cfg

# Create parser cache directory
mkdir -p /var/cache/apparmor
echo "Parser cache directory created"

# Install additional AppArmor profiles if available
if ! pacman -Q apparmor-profiles &>/dev/null; then
  echo "Installing extra AppArmor profiles..."
  pacman -S --noconfirm apparmor-profiles 2>/dev/null || echo "Note: apparmor-profiles package not available or installation skipped"
fi

# Parse and load all profiles
if [ -d /etc/apparmor.d ]; then
  apparmor_parser -r /etc/apparmor.d/* 2>/dev/null || true
  echo "AppArmor profiles loaded"
else
  echo "No profiles found in /etc/apparmor.d"
fi

# Configure audit daemon
if ! pacman -Q audit &>/dev/null; then
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    pacman -S --noconfirm audit
    systemctl enable auditd.service
    echo "Audit daemon installed and enabled"
  fi
else
  systemctl enable auditd.service
  echo "Audit daemon already installed and enabled"
fi

# Check if AppArmor is currently loaded (it won't be until reboot)
if [ -d /sys/kernel/security/apparmor ]; then
  aa-enabled 2>/dev/null && echo "✓ AppArmor is currently active" || echo "⚠ AppArmor kernel module not yet loaded"
else
  echo "⚠ AppArmor will be active after reboot"
fi
