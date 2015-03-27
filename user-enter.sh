#!/bin/bash

set -e

username="$1" && shift
groupname="$username"
userid="$1" && shift
groupid="$1" && shift
shell="$1" && shift

groupadd -g $groupid $groupname
useradd -u $userid -g $groupid -Ms $shell $username
gpasswd -a $username docker
gpasswd -a $username sudo
yes "$username" | passwd $username

exec sudo -u $username -i
