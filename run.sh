#!/bin/sh

mkdir -p "$HOME/home"
docker run --rm -it \
	-v $HOME/home:/home/`whoami` \
	-v /var/run:/srv/host.var.run \
	-v /tmp:/srv/host.tmp \
	--env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
	--privileged=true \
	quay.io/everydayhero/shell \
	`id -g docker` `whoami` `id -u` `id -g` /bin/bash
