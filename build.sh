#!/bin/sh
set -ex
DOCKER_TAG=3.3.0-3

docker build --progress plain -t "jkaldon/arm64v8-btcrpcexplorer:${DOCKER_TAG}" .
docker push "jkaldon/arm64v8-btcrpcexplorer:${DOCKER_TAG}"
