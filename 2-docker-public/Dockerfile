################################################################################
FROM golang:1.18rc1-bullseye as BUILD

WORKDIR /app
COPY *.go go.* build-app.sh ./
RUN ./build-app.sh

################################################################################
FROM debian:11-slim

WORKDIR /app
COPY --from=BUILD /app/main .
CMD ./main
