#!/bin/bash
# @moetunes
## Quickly checks if I have new gmail

outtox=0
[[ "$1" != "" ]] && outtox=1
tmp=/tmp/gmail_check.atomfeed
[[ -f $tmp ]] || touch $tmp
mssg=""

wget -T 3 -t 1 -q --secure-protocol=TLSv1 \
 --no-check-certificate \
 --user=username --password="password" \
 https://mail.google.com/mail/feed/atom -O $tmp

if [ "$(wc -l $tmp | awk '{print $1}')" -lt "2" ]; then
    echo -e "   GMAIL CHECK FAILED   \n       CHECK NEEDED     \n" |\
     xmessage -center -file -
    exit 1
fi

have_mail=`sed -n 's|<fullcount>\(.*\)</fullcount>|\1|p' $tmp`
what_mail=`sed -n 's|<title>\(.*\)</title>|\1|p' $tmp`
#echo "$what_mail"

if [ $have_mail -gt "0" ]; then
    mssg="   You have new gmail.  \n"
    mssg="$mssg   There are:\n      $have_mail new messages\n\n"
    while read -r line; do
        mssg="$mssg      $line\n"
    done < <(echo "$what_mail")
    if [ "$outtox" -lt "1" ]; then
        echo -e "$mssg" | xmessage -center -file -
     else
         echo -e "$mssg"
     fi
else
    mssg="   No new gmail.  "
    [[ "$outtox" -lt "1" ]] && echo -e "$mssg" | xmessage -center -timeout 4 -file - ||\
     echo -e "$mssg"
fi

exit 0
