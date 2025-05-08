#!/bin/bash

sudo dnf install awesome

echo "start awesome at startup"
echo "exec awesome" > ~/.xinitrc

echo "copy awesome config"
cp -r $REPO_ROOT/awesome ~/.config/
mv ~/.config/awesome/rc.fedora.lua ~/.config/awesome/rc.lua
