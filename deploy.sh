#!/bin/sh

#######################
# Deploy code to ec2
########################

source $(dirname $0)/settings.sh

echo "compressing assets ..."
tar cvzf source.tar.gz source/
echo "done ..."

echo ""

echo "copying assets to ec2 ..."
scp source.tar.gz $server:
echo "done"

ssh $server 'tar xvf source.tar.gz'
ssh $server 'rm -f source.tar.gz'