#!/bin/sh
# Detect CentOS distribution, version and architecture.

if [[ -f /etc/centos-release ]] ; then
    os=`cat /etc/centos-release | awk {'print $1}'`
    release=`cat /etc/centos-release | sed 's/^.*release //;s/ (Fin.*$//'`
    arch_bit=`uname -m | sed 's/x86_//;s/i[3-6]86/32/'`
    echo "Detected : $os $release - $arch_bit Bit ($(arch))"
else
    echo "ERROR : Centos installation not detected!"
    exit
fi
