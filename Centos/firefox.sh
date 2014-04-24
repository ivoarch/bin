#!/bin/sh

# Firefox version
version=29.0

echo "Downloading Firefox-$version..."
cd /usr/local/src
# 32-bit
wget ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${version}/linux-i686/en-US/${version}.tar.bz2
# 64-bit
#wget ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${version}/linux-x86_64/en-US/${version}.tar.bz2
echo "Installing Firefox-$version..."
tar -xjvf firefox-${version}.tar.bz2
rm -r /opt/firefox29
mv firefox /opt/firefox29
rm /usr/bin/firefox
ln -s /opt/firefox29/firefox /usr/bin/firefox
echo "Cleaning up..."
rm -rf firefox-${version} firefox-${version}.tar.bz2

exit
