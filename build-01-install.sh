#!/bin/bash
set -e
source /build/buildconfig
set -x

PACKAGES="
  curl
  gcc
  git
  mysql-client-5.5
  nmap
  openssh-client
  postgresql-client
  procps
  python-dev
  python-httplib2
  python-pip
  python-software-properties
  redis-tools
  software-properties-common
  sudo
  vim-nox
  wget
"

$minimal_apt_get_install $PACKAGES

pip install ansible
