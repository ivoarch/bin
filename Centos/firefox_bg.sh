#!/bin/sh
# Firefox на български.

echo "Removing firefox..."
yum remove -y firefox

# Firefox version
version=24.7.0esr

echo "Downloading Firefox-$version..."
cd /usr/local/src
# 32-bit
wget ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${version}/linux-i686/bg/firefox-${version}.tar.bz2
# 64-bit
#wget ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${version}/linux-x86_64/bg/firefox-${version}.tar.bz2
echo "Installing Firefox-$version..."
tar -xjvf firefox-${version}.tar.bz2
rm -rf /opt/firefox
mv firefox /opt/firefox
rm /usr/bin/firefox
ln -s /opt/firefox/firefox /usr/bin/firefox
echo "Cleaning up..."
rm -rf firefox-${version} firefox-${version}.tar.bz2

exit
