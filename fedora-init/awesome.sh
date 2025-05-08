#!/bin/bash

sudo dnf install awesome

echo "start awesome at startup"
echo "exec awesom" >> ~/.xinitrc

echo "copy awesome config"
cp -r $REPO_ROOT/awesome ~/.config/
mv ~/.config/awesome/rd.fedora.lua ~/.config/awesome/rc.lua
