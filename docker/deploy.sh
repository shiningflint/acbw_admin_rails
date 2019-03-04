#!/bin/sh
# $1 = service name (app|web)
if [ -z "$1" ]
  then
    echo "No target service, exiting"
    exit 1
fi
docker-compose -f docker-compose-production.yml build $1 \
&& docker-compose -f docker-compose-production.yml up --no-deps -d $1 \
&& yes | docker image prune
