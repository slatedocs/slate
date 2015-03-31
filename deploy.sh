#!/bin/sh

#######################
# Deploy code to ec2
########################

source $(dirname $0)/settings.sh

echo "building docs ..."
rake
echo "done."

echo "compressing assets ..."
tar cvzf build.tar.gz build/
echo "done ."

echo ""

echo "copying assets to ec2 ..."
scp source.tar.gz $server:
echo "done."

echo "deloying & unpacking ..."
ssh $server 'tar xvf build.tar.gz'
ssh $server 'rm -f build.tar.gz'
echo "done."