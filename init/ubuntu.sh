#!/usr/bin/env bash

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

DIR=$(dirname $(realpath "$0"))
cd $DIR

set -ex

apt-get update
apt-get upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release python-is-python3

conf=/etc/docker/daemon.json

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

if [ ! -f "$conf" ]; then
mkdir -p $(dirname $conf)
cp ./daemon.json $conf
fi

systemctl daemon-reload
systemctl restart docker
