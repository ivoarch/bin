#!/bin/sh
# The Remi repository is a repository containing updated PHP and MySQL packages
# and is maintained by Remi. See http://rpms.famillecollet.com/enterprise/
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6.rpm

# Make sure to use the yum-priorities plugin with this repository:

# The Yum Priorities plugin:
## Can be used to enforce ordered protection of repositories, by associating priorities to repositories.
### Visit the Yum Priorities CentOS Wiki for more information: http://wiki.centos.org/PackageManagement/Yum/Priorities.
yum install -y yum-priorities

# Set priority for the EPEL repository.
echo "priority=3" >> /etc/yum.repos.d/remi.repo

# Usage:
## examples:

### To search:
# yum --enablerepo=remi search denyhosts

### To install:
# yum --enablerepo=remi install denyhosts

### Things NOT to do:
# yum --enablerepo=remi --enablerepo=rpmforge update

### Delete Repo .rpm Package
#1# rpm -qa | grep remi
#2# yum remove remi-release-6.5-1.el6.remi.noarch
#3# yum clean all
