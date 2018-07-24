#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     gitbase.sh
# author:        Steve Vasta
# created:       May 23, 2018
# modified:      July 24, 2018
# description:   Create the base directory for a local 'git' pool.

set -eux

export OS_MAJOR_VERSION=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`

#-------------------------------------------------------------------------------
# Create the directories . . .
mkdir -p /git/centos/$OS_MAJOR_VERSION
chmod -R 0777 /git

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
