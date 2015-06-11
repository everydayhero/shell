FROM debian:jessie
MAINTAINER Jonathon M. Abbott <jma@dandaraga.net>

ADD . /build
RUN /build/build.sh

ENTRYPOINT /usr/local/bin/user-enter.sh
CMD /bin/bash
