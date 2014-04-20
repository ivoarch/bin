#!/bin/sh
# Intstall Vagrant (Centos 6...)

# Vagrant version
version=1.5.3

# 32-bit
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}_i686.rpm
rpm -Uvh vagrant_${version}_i686.rpm
# 64-bit
#wget https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}_x86_64.rpm
#rpm -Uvh vagrant_${version}_x86_64.rpm
exit
