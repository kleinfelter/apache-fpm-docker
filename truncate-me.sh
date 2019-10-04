#!/bin/bash

CONTAINER=$(basename $(pwd))

if [[ -z $CONTAINER ]]; then
    echo "No container specified"
    exit 1
fi

log=$(docker inspect -f '{{.LogPath}}' $CONTAINER 2> /dev/null)
sudo truncate -s 0 $log

