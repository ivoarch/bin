#!/bin/sh
# Protect Single User Mode with Password.

# make backup
cp /etc/sysconfig/init /etc/sysconfig/init.backup

# Set to '/sbin/sulogin' to prompt for password on single-user mode
sed -i 's/SINGLE=\/sbin\/sushell/SINGLE=\/sbin\/sulogin/' /etc/sysconfig/init
