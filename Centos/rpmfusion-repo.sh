#!/bin/sh

osarch=`uname -i`

# RPMFusion: RPMFusion is a repository of add-on packages for Fedora and RHEL+EPEL
# maintained by a group of volunteers.
# RPMFusion is not a standalone repository, but an extension of RHEL/Centos/Fedora.
# RPMFusion distributes packages that have been deemed unacceptable to Red Hat or Fedora.

# RPMFusion (free)
rpm -Uvh "http://download1.rpmfusion.org/free/el/updates/6/$osarch/rpmfusion-free-release-6-1.noarch.rpm"
rpm -Uvh "http://download1.rpmfusion.org/nonfree/el/updates/6/$osarch/rpmfusion-nonfree-release-6-1.noarch.rpm"

exit
