#!/bin/sh
# Fix for Nautilus' opening every folder in a new window on RedHat/Fedora based systems.
gconftool-2 -t bool -s /apps/nautilus/preferences/always_use_browser true
