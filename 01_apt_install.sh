#!/bin/bash

sudo apt install -y vim
sudo apt install -y tmux
sudo apt install -y screen
sudo apt install -y mc
sudo apt install -y curl
sudo apt install -y binutils
sudo apt install -y htop
sudo apt install -y doublecmd-gtk
sudo apt install -y python3-pip
sudo apt install -y atop
sudo apt install -y tree
pip install --upgrade pip

# example of progress watching: cp GhostBSD.vdi /home/tecmint/Downloads/ & progress -mp $!
sudo apt install -y progress

# install and upgrade git to the latest
sudo apt install git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y

