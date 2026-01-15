#!/bin/bash

sudo apt install -y vim
sudo apt install -y neovim
sudo apt install -y tmux
sudo apt install -y xdg-utils # required for correct plugins installation for tmux
                              # see https://wiki.archlinux.org/title/Xdg-utils
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo apt install -y iptables
sudo apt install -y ufw
sudo apt install -y mc
sudo apt install -y curl
sudo apt install -y cmake
sudo apt install -y net-tools
sudo apt install -y traceroute
sudo apt install -y doublecmd-gtk
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
sudo apt install -y bat
# TODO: установка variety подразумевает добавление репозиториев, надо вынести в отдельный скрипт
sudo add-apt-repository ppa:peterlevi/ppa
sudo apt-get update
sudo apt install -y variety
# TODO: сделать выбор между neofetch и fastfetch (Ubuntu 25)
sudo apt install -y neofetch
# example of progress watching: cp GhostBSD.vdi /home/tecmint/Downloads/ & progress -mp $!
sudo apt install -y progress

# install Yandex Browser
echo $(wget -O ./yandexbrowser.deb https://browser.yandex.ru/download?os=linux&package=deb&x64=1)
sudo apt install ./yandexbrowser.deb -y
rm ./yandexbrowser.deb

# sublime stable: https://www.sublimetext.com/docs/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get update
sudo apt-get install sublime-text

# TODO: add XFCE for RDP
# install RDP tools
sudo apt install -y xrdp xorgrdp

sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y ipython3
pip install --upgrade pip
# add soft link from python to python3
sudo ln -s /usr/bin/python3 /usr/bin/python

# TODO: вынести установку gcc в отдельный скрипт, туда же вынести установку qemu
sudo apt install -y binutils
sudo apt install -y build-essential
# TODO: проверить установку qemu в зависимости от платформы
# [Как установить и пользоваться QEMU](https://selectel.ru/blog/tutorials/qemu/)
sudo apt install -y qemu-system-x86 # qemu-kvm
sudo apt install -y bridge-utils # brctl, also used for qemu
# sudo apt install -y gcc-9 g++-9 gcc-10 g++-10 gcc-11 g++-11 g++-12 gcc-12 g++-13 gcc-13 g++-14 gcc-14
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 90 --slave /usr/bin/g++ g++ /usr/bin/g++-14 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 80 --slave /usr/bin/g++ g++ /usr/bin/g++-13 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 100 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 70 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 60 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 50 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
# sudo update-alternatives -y --config gcc

# install and upgrade git to the latest
sudo apt install git
git --version
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
git --version
sudo apt install git-man
# config git
git config --global user.email "radio_swamp@mail.ru"
git config --global user.name "Alexander Khokhlov"
