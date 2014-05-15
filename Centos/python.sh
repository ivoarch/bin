#!/bin/sh
# Install Python from Source (Centos 6..)

echo "Installing missing dependencies..."
yum groupinstall -y "Development tools"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel \
		readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

# python2 version
python2_version="2.7.6"

echo "Downloading python-$python2_version..."
cd /usr/local/src
wget http://python.org/ftp/python/${python2_version}/Python-${python2_version}.tar.xz
tar xf Python-${python2_version}.tar.xz
cd Python-${python2_version}
echo "Compiling python-$python2_version..."
./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make && make altinstall
echo "Cleaning up..."
cd /usr/local/src
rm -rf Python-${python2_version}.tar.xz Python-${python2_version}

# python3 version
#python3_version="3.3.5"

#echo "Downloading python-$python3_version..."
#cd /usr/local/src
#wget http://python.org/ftp/python/${python3_version}/Python-${python3_version}.tar.xz
#tar xf Python-${python3_version}.tar.xz
#cd Python-${python3_version}
#echo "Compiling python-$python3_version..."
#./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
#make && make altinstall
#echo "Cleaning up..."
#cd /usr/local/src
#rm -rf Python-${python3_version}.tar.xz Python-${python3_version}

echo "Downloading setuptools..."
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
tar -xvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
echo "Installing setuptools with python $python2_version"
python2.7 setup.py install
#python3.3 setup.py install
echo "Cleaning up..."
cd /usr/local/src
rm -rf setuptools-1.4.2 setuptools-1.4.2.tar.gz

echo "Installing pip..."
easy_install-2.7 pip
# easy_install-3.3 pip

echo "Installing virtualenv..."
pip2.7 install virtualenv

exit
