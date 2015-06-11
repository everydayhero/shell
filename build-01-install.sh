#!/bin/bash
set -e
source /build/buildconfig
set -x

PACKAGES="
  build-essential
  curl
  docker.io
  git
  procps
  sudo
  vim-nox
  wget
"

$minimal_apt_get_install $PACKAGES
