#!/usr/bin/env bash
# Script to update hostname on Rhel/CentOS server.
# Based on script from <https://www.centosblog.com/script-update-centos-linux-servers-hostname>

if [ -z "$( egrep "CentOS|Redhat" /etc/issue)" ]; then
    echo 'Only for Redhat or CentOS'
    exit
fi

OLD_HOSTNAME="$( hostname )"
NEW_HOSTNAME="$1"

if [ -z "$NEW_HOSTNAME" ]; then
    echo -n "Please enter new hostname: "
    read NEW_HOSTNAME < /dev/tty
fi

if [ -z "$NEW_HOSTNAME" ]; then
    echo "Error: no hostname entered. Exiting."
    exit 1
fi

echo "Changing hostname from $OLD_HOSTNAME to $NEW_HOSTNAME..."

hostname "$NEW_HOSTNAME"

sed -i "s/HOSTNAME=.*/HOSTNAME=$NEW_HOSTNAME/g" /etc/sysconfig/network

if [ -n "$( grep "$OLD_HOSTNAME" /etc/hosts )" ]; then
    sed -i "s/$OLD_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
else
    echo -e "$( hostname -I | awk '{ print $1 }' )\t$NEW_HOSTNAME" >> /etc/hosts
fi

read -p "Do you want to restart networking on your server to make sure that changes will be persistent on reboot? [yn]" answer
if [[ $answer = y ]] ; then
    /sbin/service network restart
fi

echo "[Done] Your hostname has been set to $NEW_HOSTNAME"
