FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y meson pkg-config libz-dev libjansson-dev libssl-dev ninja-build 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

ADD . /repo
WORKDIR /repo/build
RUN meson ..
RUN ninja
