#!/bin/sh
set -e

banner() {
    echo
    echo "*** $* ***"
}

banner "Building container"
export ID_RSA=$(cat ~/.ssh/id_rsa | base64 -w0)
docker build \
       --no-cache \
       --build-arg "ID_RSA=${ID_RSA}" \
       --tag golang-example-use-private-repo .

banner "Running container"
docker run golang-example-use-private-repo
