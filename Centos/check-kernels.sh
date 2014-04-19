#!/bin/sh
# List or Check Installed Linux Kernels.

uname -a ; rpm -qa kernel\* | sort
