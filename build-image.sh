#!/bin/bash
set -eu

currentPath=$(realpath "$(dirname "$0")")

pushd ${currentPath}/image

echo -e "login against docker registry"
docker login "${DOCKER_REGISTRY}" -u "${IMAGE_REGISTRY_USERNAME}" -p "${DOCKER_REGISTRY_PASSWORD}"

echo -e "Build image and push it at the end"
docker build -t "${POSTGRES_IMAGE_NAME}:${POSTGRES_IMAGE_TAG}" .

echo -e "Push image"
docker push "${POSTGRES_IMAGE_NAME}:${POSTGRES_IMAGE_TAG}"

popd

echo -e "Successfully pushed image"

