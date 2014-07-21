#!/bin/sh

osarch=`uname -i`

# EPEL: Extra Packages for Enterprise Linux (EPEL) is a volunteer-based community
# effort from the Fedora project to create a repository of high-quality add-on
# packages that complement the Fedora-based Red Hat Enterprise Linux (RHEL)
# and its compatible spinoffs such as Centos or Scientific Linux.
rpm -Uvh "http://download.fedoraproject.org/pub/epel/6/$osarch/epel-release-6-8.noarch.rpm"

# Make sure to use the yum-priorities plugin with this repository:

# The Yum Priorities plugin:
## Can be used to enforce ordered protection of repositories, by associating priorities to repositories.
### Visit the Yum Priorities CentOS Wiki for more information: http://wiki.centos.org/PackageManagement/Yum/Priorities.
yum install -y yum-priorities

# Set priority for the EPEL repository.
echo "priority=3" >> /etc/yum.repos.d/epel.repo

# Usage:
## examples:

### To search:
# yum --enablerepo=epel search denyhosts

### To install:
# yum --enablerepo=epel install denyhosts

### Things NOT to do:
# yum --enablerepo=epel --enablerepo=rpmforge update

### Delete Repo .rpm Package
#1# rpm -qa | grep epel
#2# yum remove epel-release-6-8.noarch
#3# yum clean all

exit
