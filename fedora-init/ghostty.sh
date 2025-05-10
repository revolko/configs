#!/bin/bash

echo "install ghostty"
sudo dnf -y copr enable pgdev/ghostty
sudo dnf -y install ghostty

# todo ghostty configuration
