#!/bin/bash

set -e

dockergroupid="$PLAIN_SHELL_DOCKER_GROUP"
username="$PLAIN_SHELL_USERNAME"
groupname="$username"
userid="$PLAIN_SHELL_UID"
groupid="$PLAIN_SHELL_GID"
shell="$PLAIN_SHELL_SHELL"

sed -i -e "s,docker:x:[0-9]*:,docker:x:${dockergroupid}:,g" /etc/group
groupadd -g $groupid $groupname 2>/dev/null
useradd -u $userid -g $groupid -Ms $shell $username 2>/dev/null
gpasswd -a $username docker >/dev/null
gpasswd -a $username sudo >/dev/null
yes "$username" | passwd $username 2>/dev/null

exec sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" -u $username -i "$@"
