#! /bin/sh -e

# Move this bit into trojan rabbit
REPO_NAME="$1"
TAG_NAME="$GO_PIPELINE_NAME-$GO_PIPELINE_COUNTER-$GO_STAGE_NAME-$GO_STAGE_COUNTER"
FULL_IMAGE="$REPO_NAME:$TAG_NAME"

./bin/docker-build.sh $FULL_IMAGE
echo $TAG_NAME > image-tag
docker push $FULL_IMAGE
docker rmi $FULL_IMAGE
