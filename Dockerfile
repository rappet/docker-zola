FROM rust AS builder

MAINTAINER Raphael Peters <raphael.r.peters@gmail.com>

WORKDIR /usr/src
RUN git clone --branch v0.11.0 https://github.com/getzola/zola.git
WORKDIR /usr/src/zola
RUN cargo build --release

FROM alpine

COPY --from=builder /usr/src/zola/target/release/zola zola

ENTRYPOINT zola
