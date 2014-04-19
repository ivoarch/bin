#!/bin/sh
# Build Git from Source (Centos 6..)

echo "Removing git..."
yum remove -y git

echo "Installing missing dependencies..."
yum install -y zlib-devel openssl-devel cpio expat-devel gettext-devel \
    curl-devel perl-ExtUtils-CBuilder perl-ExtUtils-MakeMaker

# Git version
git_version="1.8.5.2"

echo "Downloading git-$git_version..."
cd /usr/local/src
wget --progress=bar:force -O v$git_version.tar.gz https://github.com/git/git/archive/v$git_version.tar.gz
tar -xzvf v$git_version.tar.gz
cd git-$git_version
echo "Compiling git-$git_version..."
make prefix=/usr/local all
make prefix=/usr/local install
echo "Cleaning up..."
cd /usr/local/src
rm -rf v$git_version.tar.gz git-$git_version

exit
