#!/bin/sh

WORKSPACES=$(ratpoison -c "groups" | grep "*" | sed -e 's/.*\*//')
echo "$WORKSPACES"
