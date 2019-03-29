#!/bin/bash

set -e

# Install Kubectl if not exists
if ! [ -x "$(command -v kubectl)" ]; then
  # APT transport allows the use of repositories accessed via the HTTP Secure protocol (HTTPS)
  apt-get update && apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
  apt-get update
  apt-get install -y kubectl
fi;

# Install Rancher CLI
if ! [ -x "$(command -v rancher)" ]; then
  wget https://releases.rancher.com/cli2/v2.0.5/rancher-linux-amd64-v2.0.5.tar.gz
  tar zxvf rancher-linux-amd64-v2.0.5.tar.gz
  cd rancher-v2.0.5/
  mv ./rancher /usr/local/bin/rancher

  # Remove temp files
  cd ..
  rm -rf rancher-v2.0.5/
  rm rancher-linux-amd64-v2.0.5.tar.gz
fi;
