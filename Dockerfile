# syntax=docker/dockerfile:1

#First tested with alpine 3.16.2
FROM alpine:latest

RUN \
    apk add\
    curl \
    g++

ENV NAME VAR1
ENV NAME VAR2
ENV NAME VAR3
COPY entrypoint.sh /entrypoint.sh
COPY main.cpp /main.cpp
RUN g++ -o main main.cpp
WORKDIR /
CMD ["/bin/sh", "/entrypoint.sh"]