#!/usr/bin/env bash
if [[ $# -ne 1 ]]; then
    echo "Please provide IP of box"
    exit 1
fi

IP=$1

echo "Transferring build folder to server..."
scp -r build ubuntu@$IP:/home/ubuntu/api-build

echo "Moving build folder to WordPress..."
ssh ubuntu@$IP "./update-wp.sh"

echo "Done!"
