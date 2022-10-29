#!/bin/sh
set -ex

go get github.com/pbauermeister/golang-example-public-module/v2
go build -o main main.go
