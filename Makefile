# Makefile variables
PROJECT_NAME=slate-api-documentor
REPO_NAME=Slate-API-Documentor
TAG="registry.filtered.com/${PROJECT_NAME}"

# List of packages 1 package per line relative to current location
PKG_ML = $(shell go list ./... | sed "s%_$$(pwd)%\.%g" | grep -v -e "vendor*")
# List of packages space delimited
PKG = $(shell echo ${PKG_ML} | tr "\n" " ")
# All .go files, excluding the vendors
GOFILES = $(shell find . -type f -name '*.go' -not -path "./vendor*/*")

# Environment variables that should be set
DOCKER_USER ?=
DOCKER_PASS ?=
GIT_USER ?=
GIT_PASS ?=

# Run on docker
RUN = docker-compose run ${OPTS} --name ${PROJECT_NAME}_$(shell od -An -N1 -i /dev/random | tr -dc '0-9') --rm ${PROJECT_NAME}

#
## Basic commands with docker
all: setup
# Setup the project
setup:
	docker-compose build
	${RUN} make compile

# Build the test image
imaget:
	docker build \
	--build-arg GIT_CREDENTIAL="https://${GIT_USER}:${GIT_PASS}@github.com/excelWithBusiness/" \
	--build-arg PROJECT_BUILD=test \
	--build-arg PROJECT_NAME=${PROJECT_NAME} \
	--build-arg PROJECT_REPOSITORY="github.com/excelWithBusiness/${REPO_NAME}" \
	-t ${TAG}:test .
# Build the production image
image:
	$(if $(strip $(BUILD_NUMBER)),, $(error BUILD_NUMBER is not defined))
	docker build \
	--build-arg GIT_CREDENTIAL="https://${GIT_USER}:${GIT_PASS}@github.com/excelWithBusiness/" \
	--build-arg PROJECT_BUILD=${BUILD_NUMBER} \
	--build-arg PROJECT_NAME=${PROJECT_NAME} \
	--build-arg PROJECT_REPOSITORY="github.com/excelWithBusiness/${REPO_NAME}" \
	-t ${TAG}:${BUILD_NUMBER} \
	-t ${TAG}:latest .
# Push the image layers and tags to registry
push:
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASS} https://registry.filtered.com
	docker push ${TAG}:${BUILD_NUMBER}
	docker push ${TAG}:latest
# Run command defined by ARGS variable
run:
	${RUN} bash -c "${ARGS}"
