#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     gitbase.sh
# author:        Steve Vasta
# created:       May 23, 2018
# modified:      July 25, 2018
# description:   Create the base directory for a local 'git' pool.

set -eux

#-------------------------------------------------------------------------------
# Create the directories . . .
mkdir -p /git/boxcycler/centos
chmod -R 0777 /git

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
