#!/bin/sh
set -e

banner() {
    echo
    echo "*** $* ***"
}

banner "Building container"
docker build --no-cache --tag golang-example-use-private-repo .

banner "Running container"
docker run golang-example-use-private-repo
