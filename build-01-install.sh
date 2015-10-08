#!/bin/bash
set -e
source /build/buildconfig
set -x

PACKAGES="
  ansible
  curl
  git
  openssh-client
  procps
  sudo
  vim-nox
  wget
  mysql-client-5.5
  postgresql-client
  python-httplib2
  redis-tools
  nmap
"

$minimal_apt_get_install $PACKAGES
