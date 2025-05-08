#!/bin/bash

sudo dnf install awesome

echo "start awesome at startup"
echo "exec awesome" > ~/.xinitrc

echo "copy awesome config"
cp -r $REPO_ROOT/awesome ~/.config/
mv ~/.config/awesome/rc.fedora.lua ~/.config/awesome/rc.lua

echo "configure awesome as one of gnome sessions"
echo "[GNOME Session]
Name=Awesome session
RequiredComponents=awesome;gnome-settings-daemon;
DesktopName=Awesome
" | sudo tee /usr/share/gnome-session/sessions/awesome.session

curl https://raw.githubusercontent.com/awesomeWM/awesome/master/awesome.desktop | sudo tee /usr/share/xsessions/awesome.desktop
# echo "[Desktop Entry]
# Version=1.0
# Type=Application
# Name=Awesome
# Comment=The awesome launcher!
# TryExec=/usr/bin/awesome
# Exec=/usr/bin/awesome
# " | sudo tee /usr/share/applications/awesome.desktop
