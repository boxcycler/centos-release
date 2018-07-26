#!/bin/bash -eux
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     Makefile
# author:        Steve Vasta
# modified:      July 25, 2018

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox guest additions"
    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run --nox11
    umount /mnt
    rm /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso
    rm /home/vagrant/.vbox_version
fi
