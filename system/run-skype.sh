#!/bin/bash

# check for installed app
which skype >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo -e "Skype is not installed!\n"
  exit 1
fi

# run Skype
LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so skype

echo -e "\nDone.\n"
exit 0
