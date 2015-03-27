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

exec sudo -u $username -i
