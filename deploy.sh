#!/usr/bin/env bash
set -o errexit #abort if any command fails
me=$(basename "$0")

bundle exec middleman build
bundle exec middleman deploy
