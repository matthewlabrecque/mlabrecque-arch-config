#!/bin/bash

# Some might question the use of only one file for installing all terminal tools,
# this was done intentionally due to how atomic installations work

# Required for Ghostty
. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null

# Install terminal tools
rpm-ostree refresh-md
sudo rpm-ostree install -y zsh ghostty git gh vim neovim gcc java-latest-openjdk

# Rust installer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
