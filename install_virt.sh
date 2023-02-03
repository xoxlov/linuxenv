#!/bin/sh

# https://losst.pro/ustanovka-kvm-ubuntu-16-04

# checki if value > 0
value=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
if [[ $value == 0 ]]; then
    echo "Error: Virtual Machine cannot be installed due to file /proc/cpuinfo"
    echo "       contains no instructions 'vmx' or 'svm' allowed."
else
    # if so - install
    sudo apt install qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
    sudo gpasswd -a $USER libvirt
    # check service status
    sudo systemctl status libvirtd --no-pager
    kvm-ok

    # addition for ARM
    sudo apt-get install -y qemu-system-aarch64
fi;

