#!/bin/bash
set -e
source /build/buildconfig
set -x

PACKAGES="
  ansible
  build-essential
  curl
  git
  procps
  sudo
  vim-nox
  wget
"

$minimal_apt_get_install $PACKAGES
