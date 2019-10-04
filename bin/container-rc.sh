#!/bin/bash
set -e

service php7.2-fpm start
apachectl start

while true ; do
    sleep 1000000000
done

