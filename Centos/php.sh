#!/bin/sh
# Install PHP 5.5 (Centos 6..)

# PHP core
yum --enablerepo=remi,remi-php55 install -y php php-common
# Common modules
yum --enablerepo=remi,remi-php55 install -y \
    php-cli php-gd php-pear php-mysqlnd php-pdo php-pgsql php-pecl-mongo php-sqlite php-pecl-memcached \
    php-pecl-memcache php-mbstrin php-xml php-soap php-mcrypt php-fpm

exit
