#!/bin/bash

# cd to base_dir
pushd "$(dirname "$base_dir")"
bundle exec middleman server  # let tornado chose the port

# uncd base_dir
popd
