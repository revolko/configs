#!/bin/bash

echo "install Discord"
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install discord

echo "install Telegram"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf -y install telegram-desktop

echo "install Spotify"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client

echo "install Brave"
curl -fsS https://dl.brave.com/install.sh | sh

echo "install Steam"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf -y config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install steam -y

echo "install Surfshark"
curl -fsS https://downloads.surfshark.com/linux/debian-install.sh | sh

echo "install qBittorrent"
sudo dnf install qbittorrent -y
