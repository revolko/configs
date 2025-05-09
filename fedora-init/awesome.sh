#!/bin/bash

sudo dnf install awesome X

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

echo "install plugins dependencies"

sudo dnf -y install acpid pavucontrol
git clone https://github.com/vicious-widgets/vicious.git

rm -rf ~/.config/awesome/vicious
mv vicious ~/.config/awesome/
