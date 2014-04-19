#!/bin/sh
# RPMFusion: RPMFusion is a repository of add-on packages for Fedora and RHEL+EPEL
# maintained by a group of volunteers.
# RPMFusion is not a standalone repository, but an extension of RHEL/Centos/Fedora.
# RPMFusion distributes packages that have been deemed unacceptable to Red Hat or Fedora.

# RPMFusion (free)
### 32-bit
rpm -Uvh http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm
### 64-bit
#rpm -Uvh http://download1.rpmfusion.org/free/el/updates/6/x86_64/rpmfusion-free-release-6-1.noarch.rpm

# RPMFusion (nonfree)
### 32-bit
rpm -Uvh http://download1.rpmfusion.org/nonfree/el/updates/6/i386/rpmfusion-nonfree-release-6-1.noarch.rpm
### 64-bit
#rpm -Uvh http://download1.rpmfusion.org/nonfree/el/updates/6/x86_64/rpmfusion-nonfree-release-6-1.noarch.rpm

exit
