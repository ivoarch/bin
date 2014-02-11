#!/bin/sh
# Emacs from source (Centos)

if [ ! $( id -u ) -eq 0 ]; then
    echo "Please run this script as sudo/root..."
    exit
fi

echo -e "Installing emacs dependencies..."
yum groupinstall -y "Development Tools"
yum install -y gtk+-devel gtk2-devel
yum install -y libXpm-devel libpng-devel giflib-devel libtiff-devel libjpeg-devel
yum install -y ncurses-devel

echo -e "Downloading emacs..."
VERSION=24.3
LOCAL=/usr/local/emacs/$VERSION

mkdir -p /usr/local/emacs

cd /usr/local/src
wget http://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.gz
tar xvfz emacs-$VERSION.tar.gz
cd /usr/local/src/emacs-$VERSION

echo -e "Installing emacs..."
./configure --prefix=$LOCAL
make install
cd
ln -sf /usr/local/emacs/$VERSION/bin/emacs /usr/local/bin/emacs

echo -e "Completed!"
