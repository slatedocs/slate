#! /bin/sh -e

REPO_NAME="$1"
TAG_NAME="$2"

FULL_IMAGE="$REPO_NAME:$TAG_NAME"

echo $TAG_NAME > image-name
bundle install
bundle exec middleman build
docker build . -t $FULL_IMAGE
docker push $FULL_IMAGE
docker rmi $FULL_IMAGE
