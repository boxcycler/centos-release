# centos-release
A release repository for the BoxCycler Release systems, found on the
Vagrant Cloud at https://app.vagrantup.com/boxcycler/ . . .

I found inspiration for some of this content from the Boxcutter Project
and other miscellaneous examples and content found on the web.

base-<hypervisor>:
These systems are built completely offline from checksummed ISO release
distributions of CentOS.  As part of post-processing, the components are
rearranged on the system to enable a DVD drive and set the network to general
NAT usage.  They are my source, or starting point, for building specialized
systems using Packer and other tools.

server-<hypervisor>:
These systems are built from the release boxes.  Please install the packer
plugin package found at https://github.com/themalkolm/packer-builder-vagrant.
I found that this binary should be installed in "/usr/local/bin", right next
to the "packer" binary.
