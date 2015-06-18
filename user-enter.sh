#!/bin/bash

set -e

sed -i -e "s,docker:x:[0-9]*:,docker:x:${PLAIN_SHELL_DOCKER_GID}:,g" /etc/group
groupadd -g $PLAIN_SHELL_GID $PLAIN_SHELL_GROUP
useradd -u $PLAIN_SHELL_UID -g $PLAIN_SHELL_GID -Ms $PLAIN_SHELL_SHELL $PLAIN_SHELL_USERNAME
gpasswd -a $PLAIN_SHELL_USERNAME docker >/dev/null
gpasswd -a $PLAIN_SHELL_USERNAME sudo >/dev/null
yes "$PLAIN_SHELL_USERNAME" | passwd $PLAIN_SHELL_USERNAME 2>/dev/null

exec sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" -u $PLAIN_SHELL_USERNAME -i "$@"
