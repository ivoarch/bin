#!/bin/sh
# Install Dropbox on Centos 6.5

cat << 'EOF' > /etc/yum.repos.d/dropbox.repo
[Dropbox]  
name=Dropbox Repository
#baseurl=http://linux.dropbox.com/fedora/$releasever/
baseurl=http://linux.dropbox.com/fedora/19/  
gpgkey=http://linux.dropbox.com/fedora/rpm-public-key.asc
EOF

echo "Updating..."
yum update -y

echo "Installing Dropbox..."
yum install -y nautilus-dropbox

