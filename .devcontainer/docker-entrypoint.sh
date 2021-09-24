#!/usr/bin/env bash

# start web-server
sudo /usr/sbin/nginx

# start db-server then create database and then restart db-server 
sudo /etc/init.d/mysql start
if [[ -f  /tmp/create_database.sh ]] ; then
    sudo /tmp/create_database.sh
    rm -f /tmp/create_database.sh
fi
sudo /etc/init.d/mysql restart

# create project

exec "$@"
