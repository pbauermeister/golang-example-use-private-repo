#!/bin/sh
set -ex

export GOPRIVATE=github.com/pbauermeister

for container in container-1 container-2; do (
    cd $container
    go get github.com/pbauermeister/golang-example-private-module/v2
) done
