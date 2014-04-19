#!/bin/sh
# Install Wine (Centos 6 ...)

echo "Removing wine..."
yum remove -y wine

# Wine version
wine_version=1.7.15

echo "Installing missing dependencies..."
yum groupinstall -y 'Development Tools'
yum install -y libX11-devel freetype-devel zlib-devel libxcb-devel

echo "Downloading wine-$wine_version..."
cd /usr/local/src
wget  http://prdownloads.sourceforge.net/wine/wine-$wine_version.tar.bz2
tar xjf wine-$wine_version.tar.bz2
cd wine-$wine_version/
echo "Compiling wine-$wine_version..."
./configure && make
make install
echo "Cleaning up..."
cd /usr/local/src
rm -rf wine-$wine_version.tar.bz2 wine-$wine_version

exit
