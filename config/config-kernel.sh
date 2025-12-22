#!/bin/bash

# Since the GRUB bootloader is used by default, regenerate the GRUB configuration
sudo grub-mkconfig -o /boot/grub/grub.cfg
