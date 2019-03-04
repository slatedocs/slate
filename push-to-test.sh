#!/usr/bin/env bash

IP=$SB_WP_TEST_IP

if [[ -z $IP ]]; then
    echo Please set SB_WP_TEST_IP environment variable
    exit 1
fi

echo "Updating test server..."
./.push-to-wp.sh $IP
