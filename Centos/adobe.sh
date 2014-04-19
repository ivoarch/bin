#!/bin/sh
# Install Adobe Flash Player 11.2
### 32-bit
rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
### 64-bit
#rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
#rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

yum install -y flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl

exit
