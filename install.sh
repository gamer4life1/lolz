#!/bin/sh
wget -qO - 'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub' | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/makedeb-archive-keyring.gpg &> /dev/null
echo 'deb [signed-by=/usr/share/keyrings/makedeb-archive-keyring.gpg arch=all] https://proget.hunterwittenborn.com/ makedeb main' | \
sudo tee /etc/apt/sources.list.d/makedeb.list
sudo apt update
sudo apt install makedeb
git clone https://mpr.hunterwittenborn.com/stoke-git.git
cd stoke-git
makedeb -si
sudo mkdir -p /usr/share/bash-completion/completions/
curl -s https://raw.githubusercontent.com/Henryws/stoke/master/stoke-completions | sudo tee /usr/share/bash-completion/completions/stoke >/dev/null
