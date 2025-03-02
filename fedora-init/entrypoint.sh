#!/bin/bash
echo "Starting initialization of Fedora"

dependencies="git"
echo "Install dependencies"
sudo dnf install $dependencies

echo "Install latest NeoVim"
./neovim.sh
