FROM debian:unstable 
RUN apt-get update
RUN apt-get install -y vim-nox build-essential git
RUN apt-get install -y curl wget procps
RUN apt-get install -y apt-transport-https

RUN groupadd -g 233 docker
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
	sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list" && \
	apt-get update && \
	apt-get install -y lxc-docker-1.4.1

RUN apt-get install -y sudo

RUN ln -s /srv/host.var.run/docker.sock /var/run/docker.sock

ADD user-enter.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/user-enter.sh"]
