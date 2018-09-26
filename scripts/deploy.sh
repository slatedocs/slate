#!/bin/bash

# fail the build on any failed command
set -e

# default build directory
BUILD="build/"

# validates that build directory exists
validate_build() {
  if [ -d $1 ]; then
    echo "info: validated build directory $1"
    BUILD=$1
  else
    echo "error: build directory '$1' does not exist" 1>&2
    exit 1
  fi
}

# validates that environment file exists
validate_env() {
  if [ -f $1 ]; then
    echo "info: validated environment file $1"
    source ${1}
  else
    echo "error: environment file '$1' does not exist" 1>&2
    exit 1
  fi
}

# parse command line arguments
while getopts "e:b:" opt; do
  case ${opt} in
    e)
      e=${OPTARG}
      validate_env ${e}
      ;;
    b)
      b=${OPTARG}
      validate_build ${b}
      ;;
    \?)
      echo "error: invalid option '-$OPTARG'" 1>&2
      exit 1
      ;;
  esac
done

# ensure the correct variables are defined
if [ -z "${BUCKET}" ] || [ -z "${DISTRIBUTION_ID}" ] || [ -z "${BUILD}" ]; then
  echo "error: environment variables DISTRIBUTION_ID, BUILD and/or BUCKET are not defined" 1>&2
  echo "error: you can specify them through a .env file in the app root folder" 1>&2
  echo "error: or through another file specified with the -e flag" 1>&2
  exit 1
fi

echo "info: releasing graasp developers web application"

# sync s3 bucket
aws s3 sync ${BUILD} s3://${BUCKET} --delete

# invalidate cloudfront distribution
aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths '/*'

# reinstate the readme file in the build directory
echo -e '# Build #\n\nThis folder gets deployed to S3 by Codeship. All files except the README are ignored locally.' > ${BUILD}/README.md
