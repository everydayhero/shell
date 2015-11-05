#!/bin/bash
set -e
source /build/buildconfig
set -x

DOCKER_VERSION=1.7.1-0~jessie

apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y docker-engine=$DOCKER_VERSION
