#!/bin/sh
set -ex

export GOPRIVATE=github.com/pbauermeister
go get github.com/pbauermeister/golang-example-private-module/v2
