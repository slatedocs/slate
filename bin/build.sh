#! /bin/sh -e

bundle exec middleman build
docker build -t quay.io/quintype/documentation .
