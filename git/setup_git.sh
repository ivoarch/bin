#!/bin/bash

if [ ! $# -eq 2 ];
then
    echo "usage: sh $0 user_name user_mail"
    exit;
fi

pacman -S git

user_name=$1
usere_mail=$2

git config --global user.name $user_name

git config --global user.email $user_mail

git config --global credential.helper cache

git config --global credential.helper 'cache --timeout=3600'
