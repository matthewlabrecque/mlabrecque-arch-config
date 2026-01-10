#!/bin/bash
set -e

sudo pacman -S --noconfirm nodejs npm

#Java
sudo pacman -S --noconfirm jre-openjdk jdk-openjdk gradle maven

# C/C++
sudo pacman -S --noconfirm gcc clang

# Rust
sudo pacman -S --noconfirm rust rust-src rust-bindgen rustup
rustup default stable

# Golang
sudo pacman -S --noconfirm go
