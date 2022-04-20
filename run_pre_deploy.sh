#!/bin/bash

set -e

apt-get -qq update && apt-get install -y build-essential unzip

# Install Kubectl if not exists
if ! [ -x "$(command -v kubectl)" ]; then
  # APT transport allows the use of repositories accessed via the HTTP Secure protocol (HTTPS)
  apt-get install -y apt-transport-https
  wget --no-check-certificate -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
  apt-get update
  apt-get install -y kubectl
fi;

# Install AWS CLI
if ! [ -x "$(command -v aws)" ]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install

  # Remove temp files
  rm -rf ./aws
  rm awscliv2.zip

  # Check installation
  aws --version
fi;

# AWS CLI login setting
if [[ $CIRCLE_BRANCH == "staging" ]]
then
  K8S_CLUSTER_NAME=$K8S_CLUSTER_NAME_STAGING
  K8S_CLUSTER_REGION=$K8S_CLUSTER_REGION_STAGING
else
  K8S_CLUSTER_NAME=$K8S_CLUSTER_NAME_PROD
  K8S_CLUSTER_REGION=$K8S_CLUSTER_REGION_PROD
fi;

# AWS CLI kubeconfig setting
aws eks update-kubeconfig --region $K8S_CLUSTER_REGION --name $K8S_CLUSTER_NAME
