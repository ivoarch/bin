#!/bin/sh
# RPMForge: RPMforge is one of the participating repositories in the rpmrepo project.

# 32 Bit (i386)
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
rpm -Uvh rpmforge-release-0.5.3-1.el6.rf.i686.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
# 64 Bit (x86_64)
# wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
# rpm -Uvh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
#rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt

# Make sure to use the yum-priorities plugin with this repository:

# The Yum Priorities plugin:
## Can be used to enforce ordered protection of repositories, by associating priorities to repositories.
### Visit the Yum Priorities CentOS Wiki for more information: http://wiki.centos.org/PackageManagement/Yum/Priorities.
yum install -y yum-priorities

# Set priority for the EPEL repository.
echo "priority=3" >> /etc/yum.repos.d/rpmforge.repo

# Usage:
## examples:

### To search:
# yum --enablerepo=rpmforge search denyhosts

### To install:
# yum --enablerepo=rpmforge install denyhosts

### Things NOT to do:
# yum --enablerepo=epel --enablerepo=rpmforge update

### Delete Repo .rpm Package
#1# rpm -qa | grep rpmforge
#2# yum remove rpmforge-release-0.5.3-1.el6.rf.i686
#3# yum clean all

exit
