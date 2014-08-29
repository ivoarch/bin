#!/bin/bash
# Author: Mr.Sunil Kumar
# Name: getloginfo
# File: getloginfo.sh
# Created: Aug 20, 2013
# Contact: sunlnx@gmail.com
#
# Purpose: Extracting the log information when Incident occured
#
LOGFILE="/var/log/messages"
echo "Enter the time stamp to search in log files"
read -p "Day: " DAY
read -p "Month[Eg aug..etc]: " MONTH
read -p "Hour[Eg 02, 10..etc]: " HOUR
echo;
echo -e "\e[00;31mLogs which occured in mentioned timestamp: $DAY"-"$MONTH"-"$HOUR":00" \e[00m"
echo;
cat $LOGFILE | grep "$HOUR:[0-5][0-9]" | grep -i -n "$MONTH $DAY"
