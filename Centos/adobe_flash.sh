#!/bin/sh
# Install Adobe Flash Player 11.2

osarch=`uname -i`

rpm -ivh "http://linuxdownload.adobe.com/adobe-release/adobe-release-$osarch-1.0-1.noarch.rpm"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

yum install -y flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl

exit
