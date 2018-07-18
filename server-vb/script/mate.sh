#!/bin/bash -eux
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     mate.sh
# author:        Steve Vasta
# created:       February 24, 2017
# modified:      May 16, 2018
# description:   This script will install a MATE Desktop System.
# reference:
#   http://www.45drives.com/wiki/index.php?title=Installing_MATE_on_CentOS_7

if [[ $MATE  =~ true || $MATE =~ 1 || $MATE =~ yes ]]; then
  echo "==> Installing MATE Desktop"

  #-----------------------------------------------------------------------------
  # Install the X Window System
  yum -y groupinstall "X Window system"

  #-----------------------------------------------------------------------------
  # Install the MATE packages.  This will take a few minutes
  yum -y groupinstall "MATE Desktop"

  #-----------------------------------------------------------------------------
  # Tell the system to start the Graphical Interface
  systemctl isolate graphical.target

  #-----------------------------------------------------------------------------
  # Set MATE to boot up as the default desktop environment
  systemctl isolate graphical.target
  rm -f /etc/systemd/system/default.target
  ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target

  #-----------------------------------------------------------------------------
  # Install the Gnome Disk Utility
  yum -y install gnome-disk-utility

  #-----------------------------------------------------------------------------
  # Configure for the automatic login of the 'vagrant' user
  if [ -d /usr/share/lightdm/lightdm.conf.d ]; then
    if [ ! -f /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf ]; then
      touch /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
      chmod 0644 /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
    fi
    echo "[SeatDefaults]" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
    echo "greeter-session=lightdm-gtk-greeter" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
    echo "autologin-user=vagrant" >> /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
  fi

fi

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
