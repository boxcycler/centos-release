#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# project name:  Boxcycler Builds (CentOS)
# file name:     base.sh
# author:        Steve Vasta
# created:       February 21, 2017
# modified:      May 25, 2018
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
#git clone /git/centos/7/build/prebuilt.git /tmp/prebuilt

#-------------------------------------------------------------------------------
# Install 'most'
yum -y update
yum -y install most

#-------------------------------------------------------------------------------
# Install 'puppet-agent'
#echo "==> Installing puppet-agent"
#yum --nogpgcheck localinstall /tmp/prebuilt/puppet-agent-5.5.1-1.el7.$DISTRIB_DIR.rpm -y
#
#-------------------------------------------------------------------------------
# Install 'r10k'
#
#echo "==> Installing r10k"
#
#if [ -d gems ]; then
#  rm -rf gems
#fi
#
#tar xpfj /tmp/prebuilt/r10k-gems.tar.bz2
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/colored-1.2.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/cri-2.6.1.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/log4r-1.1.10.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/multi_json-1.13.1.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/minitar-0.6.1.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/multipart-post-2.0.0.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/faraday-0.13.1.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/faraday_middleware-0.12.2.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/semantic_puppet-1.0.2.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/puppet_forge-2.2.9.gem
#/opt/puppetlabs/puppet/bin/gem install --local ./gems/r10k-2.6.2.gem
#
#rm -rf ./gems
#
#echo "==> Cleaning up prebuilt software . . ."
#rm -rf /tmp/prebuilt

#-------------------------------------------------------------------------------
# Setup puppet configuration to finish build/conf of our new machine . . .
#git clone /git/centos/7/build/puppet.git /tmp/puppet
#export PUPPETFILE=/tmp/puppet/Puppetfile ; export PUPPETFILE_DIR=/tmp/puppet/modules ; /opt/puppetlabs/puppet/bin/r10k puppetfile install

#-------------------------------------------------------------------------------
# Start puppet . . .
#/opt/puppetlabs/puppet/bin/puppet apply --modulepath=/tmp/puppet/modules /tmp/puppet/manifests/site.pp

#-------------------------------------------------------------------------------
# Cleanup the local /git directory . . .
rm -rf /git

#-------------------------------------------------------------------------------
# END OF FILE
#-------------------------------------------------------------------------------
