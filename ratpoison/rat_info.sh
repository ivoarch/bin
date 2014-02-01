#!/bin/sh
# ratpoison info

LIFE="$(($(($(date +%s) - $(date -d " $(head -1 /var/log/pacman.log | cut -d ' ' -f 1,2 | tr -d '[]')" +%s))) / 86400)) days"
PACKAGE="`pacman -Q | wc -l`"
KERNEL="`uname -r`"
MEM="`free -m | grep "buffers/" | awk {'print $3'}`"
#FREQ=$(cpufreq-info | grep "current CPU frequency" | awk '{print $5"MHz"}')
VOL="$(exec amixer get Master | egrep -o "[0-9]+%" | head -1 | egrep -o "[0-9]*")%"
HOME="$(df /dev/sda2 | awk '/^\/dev/{printf "%s ", $5}' | sed '$s/.$//')"
ROOT="$(df / | awk '/^\/dev/{printf "%s ", $5}' | sed '$s/.$//')"
#USB="$(df /mnt/usb | awk '/^\/dev/{printf "%s ", $5}' | sed '$s/.$//')"
DATE="$(date +"%d/%m/%Y %H:%M")"
BAT=$" `acpi | awk '{print $4, $3, $5}' | tr -d ','`"
EMMS=$(emacsclient -e "(emms-track-description (emms-playlist-current-selected-track))" | sed s/\"//g)
ratpoison -c "echo `echo -e "BIRTH-DAY: $LIFE \nPACKAGE: $PACKAGE \nKERNEL: $KERNEL \nMEM: $MEM \nVOL: $VOL \nHDD: /home $HOME / $ROOT \nBAT:$BAT \nDATE: $DATE \nEMMS: $EMMS"`"
