#!/bin/bash

# add current user to 'sudoers' group
sudo usermod -aG sudo ${USER}
# set NO PASSWORD for sudo user: RECIPE
# In terminal run the visudo command to edit the sudoers file: 'sudo visudo'
#   and add the following line to the sudoers list: '<username> ALL = NOPASSWD : ALL'
#   Note: Replace <username> with your real UserName in above line.
echo "$USER   ALL=NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# If it is only one command that you frequently need to execute, e.g. 'apt-get upgrade',
#   you can configure your system such that sudo someCommand does not require a password.
#   To do that, run visudo and enter something similar to the following:
#<username> ALL=(ALL) NOPASSWD: /usr/bin/apt-get upgrade
