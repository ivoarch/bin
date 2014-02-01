#!/bin/sh
# https://bbs.archlinux.org/viewtopic.php?pid=1019257#p1019257
# dep: ~/.netrc

curl -n https://mail.google.com/mail/feed/atom -s | grep fullcount | tail -c +12 | head -c -13
