#!/bin/sh
# Build Emacs from Source (Centos 6..)

echo "Removing emacs..."
yum remove -y emacs

echo -e "Installing missing dependencies..."
yum groupinstall -y "Development Tools"
yum install -y gtk+-devel gtk2-devel ncurses-devel libXpm-devel libpng-devel libXaw \
		liblockfile libotf libtiff-devel libjpeg-devel giflib-devel m17n-db m17n-lib ImageMagick

# Emacs version
emacs_version=24.3

# Emacs dir
mkdir -p /usr/local/emacs

echo "Downloading emacs-$emacs_version..."
cd /usr/local/src
wget http://ftp.gnu.org/gnu/emacs/emacs-$emacs_version.tar.gz
tar xvfz emacs-$emacs_version.tar.gz
cd emacs-$emacs_version
echo "Compiling emacs-$emacs_version..."
# https://lists.gnu.org/archive/html/help-gnu-emacs/2014-03/msg00498.html
# configure --without-gsettings
./configure --prefix=/usr/local/emacs/$emacs_version --without-gsettings
make install
echo "Cleaning up..."
cd /usr/local/src
rm -rf emacs-$emacs_version emacs-$emacs_version.tar.gz
echo "Create symlink..."
cd
ln -sf /usr/local/emacs/$VERSION/bin/emacs /usr/bin/emacs

exit
