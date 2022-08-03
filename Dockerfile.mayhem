FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y meson pkg-config libz-dev libjansson-dev libssl-dev ninja-build 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

ADD . /repo
WORKDIR /repo/build
RUN meson ..
RUN ninja

RUN mkdir -p /deps
RUN ldd /repo/build/cmd/jose | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /repo/build/cmd/jose /repo/build/cmd/jose
ENV LD_LIBRARY_PATH=/deps
