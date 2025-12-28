#!/bin/bash
# https://code.visualstudio.com/docs/setup/linux
# alternative: https://linuxcapable.com/install-visual-studio-code-on-ubuntu-linux/

LINE=$(echo && printf -vl "%${COLUMNS:-`tput cols 2>&-||echo 80`}s\n" && echo ${l// /-};)

echo "Installation of VS Code for Ubuntu"
echo

echo ${LINE}
echo "Install the signing key"
sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm -f microsoft.gpg

echo
echo ${LINE}
echo "Add a reference to the upstream package repository"
echo "Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg" | tee > vscode.sources
sudo mv vscode.sources /etc/apt/sources.list.d/vscode.sources

echo
echo ${LINE}
echo "Update the package cache and install the package"
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

echo ${LINE}
echo "VS Code installed successfully"
