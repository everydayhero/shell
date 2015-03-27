#!/bin/bash

set -e

dockergroupid="$1" && shift
username="$1" && shift
groupname="$username"
userid="$1" && shift
groupid="$1" && shift
shell="$1" && shift

sed -i -e "s,docker:x:[0-9]*:,docker:x:${dockergroupid}:,g" /etc/group
groupadd -g $groupid $groupname
useradd -u $userid -g $groupid -Ms $shell $username
gpasswd -a $username docker
gpasswd -a $username sudo
yes "$username" | passwd $username

SSH_AUTH_SOCK=`echo $SSH_AUTH_SOCK | sed -e 's,^/tmp,,'`
export SSH_AUTH_SOCK="/srv/host.tmp${SSH_AUTH_SOCK}"

exec sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" -u $username -i
