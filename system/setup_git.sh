#!/bin/bash

pacman -S git

git config --global user.name "ivoarch"

git config --global user.email "ivkuzev@gmail.com"

git config --global credential.helper cache

git config --global credential.helper 'cache --timeout=3600'
