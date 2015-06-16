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
"

$minimal_apt_get_install $PACKAGES
