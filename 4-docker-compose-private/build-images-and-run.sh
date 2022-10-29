#!/bin/sh

set -e

banner() {
    echo
    echo "*** $* ***"
}

banner "Building containers"
export ID_RSA=$(cat ~/.ssh/id_rsa | base64 -w0)
docker-compose build --no-cache

banner "Starting containers"
docker-compose up -d
docker-compose ps

banner "Running command in containers"
docker-compose run golang-example-use-private-repo-container-1 ./main
docker-compose run golang-example-use-private-repo-container-2 ./main
