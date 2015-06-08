FROM debian:jessie
MAINTAINER Jonathon M. Abbott <jonathona@everydayhero.com.au>

ADD . /build
RUN /build/build.sh

ENTRYPOINT ["/usr/local/bin/user-enter.sh"]
CMD ["/bin/bash"]
