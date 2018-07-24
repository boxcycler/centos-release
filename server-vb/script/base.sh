#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     base.sh
# author:        Steve Vasta
# created:       February 21, 2017
# modified:      July 24, 2018
# description:   Customizing an otherwise generic build.
# note 1:        Assuming file provisioners already put stuff in /tmp.

set -eux

# Variable Declaration Section
echo "==> Checking version of CentOS"
export DISTRIB_RELEASE=`lsb_release -rs`
export DISTRIB_MACHINE=`uname -m`
export DISTRIB_DIR=`uname -m`
if [ $DISTRIB_MACHINE == "i686" ]; then
  export DISTRIB_DIR="i386"
fi
export OS_MAJOR_VERSION=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`

#-------------------------------------------------------------------------------
# Install the EPEL-repositories
yum -y install epel-release

#-------------------------------------------------------------------------------
# Download prebuilt software to /tmp/prebuilt
#echo "==> Extract prebuilt software"
git clone /git/centos/$OS_MAJOR_VERSION/build/prebuilt.git /tmp/prebuilt
wget https://yum.puppetlabs.com/puppet5/puppet5-release-el-$OS_MAJOR_VERSION.noarch.rpm
rpm -iv ./puppet5-release-el-$OS_MAJOR_VERSION.noarch.rpm

#-------------------------------------------------------------------------------
# Install 'most' and 'puppet-agent' . . .
yum -y update
yum -y install most puppet-agent

#-------------------------------------------------------------------------------
# Install 'r10k'
#
echo "==> Installing r10k"
/opt/puppetlabs/puppet/bin/gem install r10k

#-------------------------------------------------------------------------------
# Setup puppet configuration to finish build/conf of our new machine . . .
git clone /git/centos/$OS_MAJOR_VERSION/build/puppet.git /tmp/puppet
export PUPPETFILE=/tmp/puppet/Puppetfile ; export PUPPETFILE_DIR=/tmp/puppet/modules ; /opt/puppetlabs/puppet/bin/r10k puppetfile install

#-------------------------------------------------------------------------------
# Start puppet . . .
/opt/puppetlabs/puppet/bin/puppet apply --modulepath=/tmp/puppet/modules /tmp/puppet/manifests/site.pp

#-------------------------------------------------------------------------------
# Cleanup the local /git directory . . .
rm -rf /git

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
