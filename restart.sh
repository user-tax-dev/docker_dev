#!/usr/bin/env bash

if [ $EUID != 0 ]; then
sudo "$0" "$@"
exit $?
fi

_DIR=$(cd "$(dirname "$0")"; pwd)
cd $_DIR

export COMPOSE_HTTP_TIMEOUT=900
export DOCKER_CLIENT_TIMEOUT=900

docker-compose restart
