#!/usr/bin/sh
# Shutdown script

xmessage "What would you like to do?" -center \
    -default "Cancel" \
    -buttons "Cancel":1,"Reboot":2,"Shutdown":3,"Reload":4,"Quit":5

case $? in
    1)
        echo "Exit" ;;
    2)
        exec systemctl reboot ;;
    3)
        exec systemctl poweroff ;;
    4)
        exec ratpoison -c restart ;;
    5)
        exec ratpoison -c quit ;;
esac
