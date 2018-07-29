#!/bin/bash -eux
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# modified:      July 29, 2018

echo "==> Installing VirtualBox guest additions"
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso
rm /home/vagrant/.vbox_version
