#!/usr/bin/env bash

set -e

# Colors
yellow="\e[33m"
noc='\033[0m'

# docker login
echo -e "${yellow}\nDocker Login${noc}"
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD $DOCKER_REGISTRY

# build image
echo -e "${yellow}\nDocker build${noc}"
docker build -t $DOCKER_REGISTRY/$PROJECT_NAME .

# set tag by branch
echo -e "${yellow}\nDocker set tag${noc}"
docker tag $DOCKER_REGISTRY/$PROJECT_NAME \
  $DOCKER_REGISTRY/$PROJECT_NAME:$CIRCLE_BRANCH-$CIRCLE_BUILD_NUM

# push image
echo -e "${yellow}\nDocker push image${noc}"
docker push $DOCKER_REGISTRY/$PROJECT_NAME
docker push $DOCKER_REGISTRY/$PROJECT_NAME:$CIRCLE_BRANCH-$CIRCLE_BUILD_NUM
