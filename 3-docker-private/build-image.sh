#!/bin/bash
set -e
ID_RSA=$(cat ~/.ssh/id_rsa | base64 -w0)
set -x

DOCKER_BUILDKIT=1 docker build \
       --no-cache \
       --secret id=ID_RSA,src=<(set +x; echo $ID_RSA) \
       --tag golang-example-use-private-repo .
