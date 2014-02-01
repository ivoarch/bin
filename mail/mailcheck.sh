#!/bin/bash
maildirs="$HOME/Maildir/Gmail/INBOX/new"

find $maildirs -type f | wc -l
exit 0
