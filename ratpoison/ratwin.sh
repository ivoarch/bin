#!/bin/sh

WINDOWS=`ratpoison -c "windows"`
echo "$WINDOWS" |
while read name; do
    if [[ "$name" =~ "*" ]]
    then
        echo -n "$name"
    else
        if [ "$name" = "No managed windows" ]
        then
            echo -n " $name "
       fi
    fi
done
