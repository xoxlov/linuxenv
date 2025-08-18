#!/bin/bash

wget https://browser.yandex.ru/download?os=linux&package=deb&x64=1
rm wget-log
mv ./download\?os\=linux ./yandexbrowser.deb
sudo apt install ./yandexbrowser.deb -y
rm ./yandexbrowser.deb
