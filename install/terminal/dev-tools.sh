#!/bin/bash

# This file contains commonly used libraries for common dev environments

# Base tools and libs
# NodeJS and NPM required for Neovim linters to work properly
# curl, tar, and unzip required for Clang to work as intended
sudo pacman -S --noconfirm base-devel git unzip curl tar nodejs npm

#Java
sudo pacman -S --noconfirm jre-openjdk jdk-openjdk gradle maven

# C/C++
sudo pacman -S --noconfirm gcc clang

# Rust
sudo pacman -S --noconfirm rust rust-src rust-bindgen rustup
rustup default stable

# Golang
sudo pacman -S --noconfirm go
