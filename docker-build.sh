#!/bin/sh

# Exit immediately if a pipeline returns a non-zero status:
set -e

# Sign in to the Docker registry:
echo "$CI_REGISTRY_PASSWORD" | docker login \
    --username $CI_REGISTRY_USER \
    --password-stdin \
    $CI_REGISTRY

export DOCKER_IMAGE_NAME="$CI_REGISTRY/$CI_PROJECT_PATH:$POETRY_VERSION-py$PYTHON_VERSION"

docker build \
    --build-arg PYTHON_VERSION=$PYTHON_VERSION \
    --build-arg POETRY_VERSION=$POETRY_VERSION \
    --compress \
    --force-rm \
    --no-cache \
    --quiet \
    --tag $DOCKER_IMAGE_NAME \
    .

docker push $DOCKER_IMAGE_NAME
unset DOCKER_IMAGE_NAME
