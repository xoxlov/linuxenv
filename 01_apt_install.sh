#!/bin/bash

sudo apt install -y vim
sudo apt install -y tmux
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo apt install -y iptables
sudo apt install -y ufw
sudo apt install -y mc
sudo apt install -y curl
sudo apt install -y neovim
sudo apt install -y binutils
sudo apt install -y build-essential
sudo apt install -y cmake
sudo apt install -y net-tools
sudo apt install -y doublecmd-gtk
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y ipython3
sudo apt install -y htop
sudo apt install -y atop
sudo apt install -y tree
sudo apt install -y tldr
sudo apt install -y colordiff
sudo apt install -y highlight
sudo apt install -y meld
sudo apt install -y cmatrix
sudo apt install -y tcpdump
sudo apt install -y zsh
sudo apt install -y fish
sudo apt install -y sublime-text
sudo apt install -y bat
# example of progress watching: cp GhostBSD.vdi /home/tecmint/Downloads/ & progress -mp $!
sudo apt install -y progress

# sudo apt install -y gcc-9 g++-9 gcc-10 g++-10 gcc-11 g++-11 g++-12 gcc-12 g++-13 gcc-13 g++-14 gcc-14
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 90 --slave /usr/bin/g++ g++ /usr/bin/g++-14 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 80 --slave /usr/bin/g++ g++ /usr/bin/g++-13 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 100 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 70 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 60 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 50 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
# sudo update-alternatives -y --config gcc

pip install --upgrade pip

# install and upgrade git to the latest
sudo apt install git
git --version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
git --version
sudo apt install git-man

## http://ytdl-org.github.io/youtube-dl/download.html
#sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
#sudo chmod a+rx /usr/local/bin/youtube-dl

# add soft link from python to python3
sudo ln -s /usr/bin/python3 /usr/bin/python
