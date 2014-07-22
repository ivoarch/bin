#!/bin/sh
# Installing LibreOffice (Centos 6...)

# LibreOffice version
version=4.2.5

## 32-bit
echo "Downloading LibreOffice-$version..."
cd /usr/local/src
wget "http://download.documentfoundation.org/libreoffice/stable/${version}/rpm/x86/LibreOffice_${version}_Linux_x86_rpm.tar.gz"
tar -xzvf LibreOffice_${version}_Linux_x86_rpm.tar.gz
cd LibreOffice_4.2.5.2_Linux_x86_rpm/RPMS
echo "Installing LibreOffice-$version..."
rpm -i *.rpm
echo "Cleaning up..."
cd /usr/local/src
#rm -rf LibreOffice_${version}_Linux_x86_rpm LibreOffice_${version}_Linux_x86_rpm.tar.gz

## 64-bit
#echo "Downloading LibreOffice-$version..."
#cd /usr/local/src
#wget http://download.documentfoundation.org/libreoffice/stable/${version}/rpm/x86_64/LibreOffice_${version}_Linux_x86-64_rpm.tar.gz
#tar -xzvf LibreOffice_${version}_Linux_x86_64_rpm.tar.gz
#cd LibreOffice_4.2.5.2_Linux_x86_64_rpm/RPMS
#echo "Installing LibreOffice-$version..."
#rpm -i *.rpm
#echo "Cleaning up..."
#cd /usr/local/src
#rm -rf LibreOffice_${version}_Linux_x86_64_rpm LibreOffice_${version}_Linux_x86_64_rpm.tar.gz

exit
