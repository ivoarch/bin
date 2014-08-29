#!/bin/sh
# Clementine 1.2 (Centos 6..)

# Clementine version
version="1.2.1"

echo "Installing missing dependencies..."
yum --enablerepo=epel install -y gcc-c++ liblastfm-devel taglib-devel gettext boost-devel \
    qt-devel cmake28 gstreamer-devel gstreamer-plugins-base-devel glew-devel \
    libgpod-devel libplist-devel usbmuxd-devel libmtp-devel protobuf-devel \
    protobuf-compiler qca2-devel libcdio-devel qca-ossl fftw-devel \
    sparsehash-devel sqlite-devel gstreamer-plugins-ugly \

# https://code.google.com/p/clementine-player/wiki/CompilingFromSource
rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/i386/qjson-0.7.1-2.el6.nux.1.i686.rpm
rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/i386/qjson-devel-0.7.1-2.el6.nux.1.i686.rpm

echo "Downloading clementine..."
cd /usr/local/src
wget http://clementine-player.googlecode.com/files/clementine-${version}.tar.gz
tar -xzvf clementine-${version}.tar.gz
cd clementine-${version}
echo "Compiling clementine..."
cd bin
cmake28 ..
make -j8
make install
echo "Cleaning up..."
cd /usr/local/src
rm -rf clementine-${version}.tar.gz clementine-${version}

exit
