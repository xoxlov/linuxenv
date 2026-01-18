#!/bin/bash

sudo pacman -S --needed base-devel git

## Install an AUR helper
#sudo pacman -S --needed base-devel git
#git clone https://aur.archlinux.org/yay-git.git
#cd yay
#makepkg -si

## Install Google Chrome using AUR helper
#yay -S google-chrome

# Install Chrome from AUR
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
makepkg -si
cd ..

git clone https://aur.archlinux.org/yandex-browser.git
cd yandex-browser
makepkg -si
cd ..
