#!/bin/sh
# Install Skype on Centos 6.5

cat << 'EOF' > /etc/yum.repos.d/skype.repo
[epel-skype]
name=Skype binary packages
baseurl=http://negativo17.org/repos/skype/epel-$releasever/$basearch/
enabled=1
skip_if_unavailable=1
gpgkey=http://negativo17.org/repos/RPM-GPG-KEY-slaanesh
gpgcheck=1
EOF

echo "Updating..."
yum update -y

echo "Installing Skype..."
yum install -y skype
