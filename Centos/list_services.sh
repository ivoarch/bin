#!/bin/sh
# List or Check enabled services.

chkconfig --list |grep "3:on" |awk '{print $1}' |sort
exit
