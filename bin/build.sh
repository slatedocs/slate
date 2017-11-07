#! /bin/sh -e

bundle install
bundle exec middleman build
docker build -t quay.io/quintype/documentation .
