# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y meson 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pkg-config libz-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libjansson-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev
ADD . /repo
WORKDIR /repo/build
RUN meson ..
RUN ninja
