#!/bin/sh

docker_group() {
	getent group docker | cut -f 3-3 -d:
}

mkdir -p "$HOME/home"
docker run --rm -it \
	-v $HOME/home:/home/`whoami` \
	-v /var/run:/srv/host.var.run \
	-v /tmp:/srv/host.tmp \
	--env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
	--privileged=true \
	quay.io/everydayhero/shell \
	`docker_group` `whoami` `id -u` `id -g` /bin/bash
