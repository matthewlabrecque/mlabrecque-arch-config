#!/bin/bash

# This file contains commonly used libraries for common dev environments

# Base tools
sudo pacman -S --noconfirm base-devel git

#Java
sudo pacman -S --noconfirm jre-openjdk jdk-openjdk

# C/C++
sudo pacman -S --noconfirm gcc clang

# Rust
sudo pacman -S --noconfirm rust rust-src rust-bindgen rustup
rustup default stable

# Golang
sudo pacman -S --noconfirm go
