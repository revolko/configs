#!/bin/bash

RepoRoot=$(cd "$(dirname $BASH_SOURCE)" && cd ../ && pwd)

echo "Downloading latest NeoVim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

echo "Remove previous version"
sudo rm -rf /opt/nvim

echo "Export NeoVim to /opt dir"
sudo mkdir -p /opt/nvim
sudo tar -C /opt/nvim --strip-components 1 -xzf nvim-linux-x86_64.tar.gz

echo "Add NeoVim to PATH in .bashrc"
echo 'export PATH=/opt/nvim/bin:$PATH' >> ~/.bashrc  # simple quotes --> vars are not evaluated
source ~/.bashrc

echo "Copy NeoVim config"
rm -rf ~/.config/nvim
cp -r $RepoRoot/nvchad ~/.config/
mv ~/.config/nvchad ~/.config/nvim

echo "Cleanup NeoVim archive"
rm -f nvim-linux-x86_64.tar.gz
