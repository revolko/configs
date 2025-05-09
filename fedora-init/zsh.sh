#!/bin/bash

sudo dnf -y install zsh

echo "set zsh as default"
chsh -s $(which zsh)

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "copy zsh config"
cp $REPO_ROOT/.zshrc ~/
