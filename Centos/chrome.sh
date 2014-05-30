#!/bin/sh
# Install Google Chrome in (CentOS 6..)
# Source https://www.centos.org/forums/viewtopic.php?f=14&t=46026#p196913

echo "Downloading Chrome script..."
cd /usr/local/src
wget http://chrome.richardlloyd.org.uk/install_chrome.sh
echo "Compilling Chrome..."
sh install_chrome.sh
echo "Cleaning up..."
rm install_chrome.sh

exit
