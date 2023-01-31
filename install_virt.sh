#!/bin/sh

# https://losst.pro/ustanovka-kvm-ubuntu-16-04

# checki if value > 0
egrep -c '(vmx|svm)' /proc/cpuinfo
# if so - install
sudo apt install qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
sudo gpasswd -a $USER libvirt
# check service status
sudo systemctl status libvirtd
kvm-ok

# addition for ARM
sudo apt-get install -y qemu-system-aarch64

