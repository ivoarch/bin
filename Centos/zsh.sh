#!/bin/sh
# Build Zsh from Source (Centos 6..)

echo "Removing zsh..."
yum remove -y zsh

echo "Installing missing dependencies..."
yum install -y ncurses-devel

# Zsh version
zsh_version=5.0.5

echo "Downloading zsh-$zsh_version..."
cd /usr/local/src
wget --progress=bar:force -O zsh-$zsh_version.tar.bz2 http://sourceforge.net/projects/zsh/files/zsh/$zsh_version/zsh-$zsh_version.tar.bz2/download
tar -jxvf ./zsh-$zsh_version.tar.bz2
echo "Compiling zsh-$zsh_version..."
cd zsh-$zsh_version/
./configure --prefix=/usr --with-tcsetpgrp
make -j 2
make install
echo "Adding zsh-$zsh_version to shells..."
echo /usr/bin/zsh >> /etc/shells
echo "Making zsh-$zsh_version default shell"
chsh -s /usr/bin/zsh $(whoami)
echo "Cleaning up..."
cd /usr/local/src
rm -rf ./zsh-$zsh_version.tar.bz2 zsh-$zsh_version

exit
