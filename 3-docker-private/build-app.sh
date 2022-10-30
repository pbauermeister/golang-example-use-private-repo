#!/bin/sh
set -ex

if [ ! -f /run/secrets/ID_RSA ]; then
    echo >&2 "Error: /run/secrets/ID_RSA is not available"
    exit 1
fi

# Prepare to access the repo via SSH
mkdir ~/.ssh
cat /run/secrets/ID_RSA | base64 -d > ~/.ssh/id_rsa
chmod og-rw ~/.ssh/id_rsa

ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Get module and build
export GOPRIVATE=github.com/pbauermeister
git config --global url."git@github.com:".insteadOf "https://github.com/"
go get github.com/pbauermeister/golang-example-private-module/v2
go build -o main main.go

# Cleanup
rm -rf ~/.ssh
