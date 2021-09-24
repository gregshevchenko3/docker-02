#!/usr/bin/env bash

source /workspace/db.env.sh

if [[ -n "$MYSQL_DB_NAME" ]] && [[ -n "$MYSQL_DB_USERNAME" ]] && [[ -n "$MYSQL_DB_PASSWORD" ]] ; then
    sed -e "s/{{{SQL_DATABASE_NAME}}}/${MYSQL_DB_NAME}/g" \
        -e "s/{{{SQL_DATABASE_USERNAME}}}/${MYSQL_DB_USERNAME}/g" \
        -e "s/{{{SQL_DATABASE_PASSWORD}}}/${MYSQL_DB_PASSWORD}/g" /tmp/database.sql > /tmp/database_create.sql

    mysql -e "source /tmp/database_create.sql" &>/tmp/log
    rm -vf /tmp/database*.sql
    unset MYSQL_DB_NAME MYSQL_DB_USERNAME MYSQL_DB_PASSWORD
fi

