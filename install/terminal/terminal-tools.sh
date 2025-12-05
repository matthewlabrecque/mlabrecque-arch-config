#!/bin/bash

# Some might question the use of only one file for installing all terminal tools,
# this was done intentionally due to how atomic installations work

# Install terminal tools
rpm-ostree refresh-md
sudo rpm-ostree install -y zsh git gh vim neovim
