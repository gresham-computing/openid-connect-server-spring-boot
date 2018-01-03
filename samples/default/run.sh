#!/bin/bash
set -eu

gradle buildDocker

CONTID=$(docker run -d --rm gresham/mitreid:0.1.4-SNAPSHOT)
IP=$(docker inspect $CONTID | jq -r '.[0]["NetworkSettings"]["IPAddress"]')
echo $CONTID $IP:8080
read -p "Hit ENTER to exit" _
docker kill $CONTID > /dev/null
