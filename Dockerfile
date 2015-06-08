FROM debian:stable
MAINTAINER Jonathon M. Abbott <jma@dandaraga.net>

ADD . /build
RUN /build/build.sh
