#!/bin/sh
# Install Ruby on Centos 6.. with RVM

echo "Install Required Packages..."
yum install -y libyaml-devel libffi-devel openssl-devel make

# If you are using GNOME on Red Hat, CentOS or Fedora, ensure that the
# Run command as login shell option is checked under the Title and Command tab in Profile Preferences.
# After changing this setting, you may need to exit your console session
# and start a new one before the changes take affect.
# http://rvm.io/rvm/install

# Install RVM
curl -L https://get.rvm.io | bash -s stable

# Source RVM
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.zshrc
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc

# Install specified Ruby Version
rvm install 2.1.0
#rvm install 2.1.2

# Use installed Ruby version as the default one
rvm use 2.1.0
#rvm use 2.1.2
rvm use 2.1.0 --default
