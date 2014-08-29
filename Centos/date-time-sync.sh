#!/bin/sh
# Sync Time and Date on RHEL/CentOS linux

# install NTP (Network Time Protocol)
yum install -y ntp
# sync time-date
/usr/sbin/ntpdate 0.centos.pool.ntp.org
sleep 3
# call hwclock to set the hardware clock
hwclock --systohc
# start up automatically on boot
/sbin/chkconfig ntpd on
# start the NTP service
/sbin/service ntpd start
# checking current time-date
date
# report the synchronisation state of the NTP daemon
ntpstat
ntpq -pn

exit
