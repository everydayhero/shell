#!/bin/bash

plain_shell_env() {
cat <<EOF
PLAIN_SHELL_DOCKER_GROUP=$(getent group docker | cut -f 3-3 -d:)
PLAIN_SHELL_USERNAME=$(id -un)
PLAIN_SHELL_GROUP=$(id -gn)
PLAIN_SHELL_UID=$(id -u)
PLAIN_SHELL_GID=$(id -g)
PLAIN_SHELL_SHELL=/bin/bash
EOF
}

mkdir -p "$HOME/home"
docker run --rm -it \
  -v $HOME/home:/home/`whoami` \
  -v /var/run:/srv/host.var.run \
  -v /tmp:/srv/host.tmp \
  -v $SSH_AUTH_SOCK:/srv/ssh-auth.sock \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --env SSH_AUTH_SOCK=/srv/ssh-auth.sock \
  --env-file <(plain_shell_env) \
  --privileged=true \
  "${SHELL_TAG:-quay.io/everydayhero/shell}" \
  "$@"
