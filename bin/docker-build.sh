#!/bin/sh -e

bundle install
bundle exec middleman build
docker build . -t $1
