#!/bin/sh
# Aircrack-ng - Latest SVN (development) Sources on (Centos 6...)

echo "Installing missing dependencies..."
# http://www.aircrack-ng.org/doku.php?id=install_aircrack
yum install -y gcc-c++ openssl-devel zlib sqlite libnl-devel

echo "Downloading aircrack-ng..."
cd /usr/local/src
svn co http://svn.aircrack-ng.org/trunk/ aircrack-ng
cd aircrack-ng
echo "Compiling aircrack-ng..."
make sqlite=true unstable=true install
sleep 2
/usr/local/sbin/airodump-ng-oui-update
echo "Cleaning up..."
cd /usr/local/src
rm -rf aircrack-ng

# The Aircrack-ng suite programs and man pages are placed in
# /usr/local/sbin/
# /usr/local/share/man/man1/aircrack-ng.1
# Example: sudo /usr/local/sbin/airmon-ng start <net interface>
# Happy Hacking!!!
