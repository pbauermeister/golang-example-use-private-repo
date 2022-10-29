#!/bin/sh
set -ex

export GOPRIVATE=github.com/pbauermeister
git config --global url."git@github.com:".insteadOf "https://github.com/"
go get github.com/pbauermeister/golang-example-private-module/v2
go build -o main main.go

./main
