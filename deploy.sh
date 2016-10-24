#!/usr/bin/env bash
set -o errexit #abort if any command fails
bundle exec middleman build --clean
aws s3 rm s3://developers.geezeo.com --recursive
aws s3 sync build s3://developers.geezeo.com --acl public-read --cache-control "public, max-age=86400"
