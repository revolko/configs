#!/bin/bash

echo "install docker"
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo groupadd docker
sudo usermod -aG docker $USER

echo "install Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.zshrc  # custom .zshrc has correct ENV vars set
nvm install node

echo "install awscli"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
rm -rf ./aws

echo "install aws-cdk"
npm install -g aws-cdk

echo "install drawio"
curl -Lo drawio.rpm https://github.com/jgraph/drawio-desktop/releases/download/v27.0.2/drawio-x86_64-27.0.2.rpm
sudo dnf -y install ./drawio.rpm
rm drawio.rpm
