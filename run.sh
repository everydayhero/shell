#!/bin/sh

docker_group() {
  getent group docker | cut -f 3-3 -d:
}

mkdir -p "$HOME/home"
docker run --rm -it \
  -v $HOME/home:/home/`whoami` \
  -v /var/run:/srv/host.var.run \
  -v /tmp:/srv/host.tmp \
  -v $SSH_AUTH_SOCK:/srv/ssh-auth.sock \
  --env SSH_AUTH_SOCK=/srv/ssh-auth.sock \
  --env PLAIN_SHELL_DOCKER_GROUP=`docker_group` \
  --env PLAIN_SHELL_USERNAME=`whoami` \
  --env PLAIN_SHELL_UID=`id -u` \
  --env PLAIN_SHELL_GID=`id -g` \
  --env PLAIN_SHELL_SHELL=/bin/bash \
  --privileged=true \
  "${SHELL_TAG:-quay.io/everydayhero/shell}" \
  "$@"
