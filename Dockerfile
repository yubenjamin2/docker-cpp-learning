# syntax=docker/dockerfile:1

#First tested with alpine 3.16.2
FROM alpine:latest

WORKDIR /app

COPY . .