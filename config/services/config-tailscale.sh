#!/bin/bash
set -e

sudo systemctl enable --now tailscaled
sudo tailscale up
