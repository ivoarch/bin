#!/bin/env bash

usage() {
    echo ""
    echo "$0 - Convert hex color code to RGB and RGB to HEX (Hexadecimal)"
    echo ""
    echo "Usage: $0 [HEX] or [RGB] color value"
    echo ""
    echo "Example HEX to RGB: $0 0000ff"
    echo "Example RGB to HEX: $0 0,0,255"
    echo ""
    exit 1
}

if [ $# -eq 0 ]; then
    echo 'Invalid color value!';
    usage;
fi

if [[ $1 =~ ([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2}) ]]; then
    printf "(%d, %d, %d)\n" \
           0x"${BASH_REMATCH[1]}" 0x"${BASH_REMATCH[2]}" 0x"${BASH_REMATCH[3]}"
elif [[ $1 =~ ([[:digit:]]{1,3}),([[:digit:]]{1,3}),([[:digit:]]{1,3}) ]]; then
    printf "#%02x%02x%02x\n" \
           "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"
fi
