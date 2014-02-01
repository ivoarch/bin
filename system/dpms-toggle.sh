#!/bin/zsh
# Toggle dpms and X screen blanking.

xset -q | grep -q "DPMS is Enabled" && {
    xset -dpms; xset s off
    ratpoison -c "echo Disabled screen blanking and powersaving"
    exit
}
xset -q | grep -q "DPMS is Disabled" && {
    xset +dpms; xset s on
    ratpoison -c "echo Enabled screen blanking and powersaving"
}
