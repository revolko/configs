#!/bin/bash

echo "clean TMUX config"
rm -rf ~/.config/tmux || echo "no config deleted"

sudo dnf install tmux

# install TPM
echo "install TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "copy TMUX config"
cp -r $REPO_ROOT/tmux ~/.config

echo "requires manual install of TPM plugins (prefix + I)"
