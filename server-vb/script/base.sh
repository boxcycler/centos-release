#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     base.sh
# author:        Steve Vasta
# created:       February 21, 2017
# modified:      July 27, 2018
# description:   Customizing an otherwise generic build.
# note 1:        Assuming file provisioners already put stuff in /tmp.

set -eux

# Variable Declaration Section
export OS_MAJOR_VERSION=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`

#-------------------------------------------------------------------------------
# Download and install the puppet5 repo . . .
wget https://yum.puppetlabs.com/puppet5/puppet5-release-el-$OS_MAJOR_VERSION.noarch.rpm
rpm -iv ./puppet5-release-el-$OS_MAJOR_VERSION.noarch.rpm

#-------------------------------------------------------------------------------
# Install 'puppet-agent' . . .
yum -y update
yum -y install puppet-agent

#-------------------------------------------------------------------------------
# Install 'r10k'
#
echo "==> Installing r10k"
/opt/puppetlabs/puppet/bin/gem install r10k

#-------------------------------------------------------------------------------
# Setup puppet configuration to finish build/conf of our new machine . . .
git clone https://github.com/boxcycler/centos-puppet /tmp/puppet
( cd /tmp/puppet ; /opt/puppetlabs/puppet/bin/r10k puppetfile install )

#-------------------------------------------------------------------------------
# Start puppet . . .
/opt/puppetlabs/puppet/bin/puppet apply --modulepath=/tmp/puppet/modules /tmp/puppet/manifests/site.pp

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
