#!/bin/sh
## Install Dropbox (Centos 6...)

### 32-bit
wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-1.6.0-1.fedora.i386.rpm
yum Install -y nautilus-dropbox-1.6.0-1.fedora.i386.rpm
### 64-bit
#wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-1.6.0-1.fedora.x86_64.rpm
#yum Install -y nautilus-dropbox-1.6.0-1.fedora.x86_64.rpm

exit
