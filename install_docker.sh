#!/bin/sh

# https://losst.pro/ustanovka-docker-na-ubuntu-16-04

# docker
#sudo apt install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt install -y linux-image-extra-virtual
sudo apt install -y apt-transport-https
sudo apt install -y ca-certificates
sudo apt install -y curl
sudo apt install -y software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && apt-cache policy docker-ce
sudo apt install -y docker-ce

sudo usermod -aG docker $(whoami)

# check
sudo systemctl status docker --no-pager

# docker-compose
DOCKER_COMPOSE="https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)"
sudo curl -L ${DOCKER_COMPOSE} -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# check
docker-compose --version

