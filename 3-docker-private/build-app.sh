#!/bin/sh
set -e

if [ -z "$ID_RSA" ]; then
    cat >&2 <<-EOF
	Error: ID_RSA is not set
	EOF
    exit 1
fi

set -x
mkdir ~/.ssh
(set +x; echo $ID_RSA) | base64 -d > ~/.ssh/id_rsa
chmod og-rw ~/.ssh/id_rsa

ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# use ssh instead of https
git config --global url."git@github.com:".insteadOf "https://github.com/"


export GOPRIVATE=github.com/pbauermeister
ls -a $PWD
go get github.com/pbauermeister/golang-example-private-module/v2
go build -o main main.go
