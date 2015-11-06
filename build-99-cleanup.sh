#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get purge -y gcc
apt-get autoremove -y
apt-get clean
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
rm -f /etc/dpkg/dpkg.cfg.d/docker-apt-speedup

# rm -f /etc/ssh/ssh_host_*
