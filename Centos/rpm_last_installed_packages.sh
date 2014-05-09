#!/bin/sh
# Display last installed packages.
rpm -q --all --last | less
