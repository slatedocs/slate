#!/bin/bash

sudo locale-gen en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -yq ruby ruby-dev build-essential git
sudo gem install --no-ri --no-rdoc bundler
cd /vagrant/ && bundle exec middleman server
