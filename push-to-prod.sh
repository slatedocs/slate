#!/usr/bin/env bash

IP=$SB_WP_PROD_IP

if [[ -z $IP ]]; then
    echo Please set SB_WP_PROD_IP environment variable
    exit 1
fi

echo "Updating prod server..."
./.push-to-wp.sh $IP

