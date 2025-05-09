#!/bin/bash
echo "Starting initialization of Fedora"

RepoRoot=$(cd "$(dirname $BASH_SOURCE)" && cd ../ && pwd)
export REPO_ROOT=$RepoRoot

dependencies="git"
echo "Install dependencies"
sudo dnf install $dependencies

echo "Install latest NeoVim"
./neovim.sh

echo "Install TMUX"
./tmux.sh

echo "Install ghostty"
./ghostty.sh

echo "Install awesome"
./awesome.sh

echo "Install zsh"
./zsh.sh
