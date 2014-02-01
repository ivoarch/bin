#!/bin/bash
# emulate stumpwms run-or-raise with ratpoison
# Param1: Windowname to look for
# Param2: Command to start if not present yet

ratpoison -c windows|grep -q $1

if [ $? -eq 0 ] ; then
#    echo "Value grep: $? . selecting"
    ratpoison -c "select $1"
else
#    echo "Value grep: $? . starting"
    $2&
fi
