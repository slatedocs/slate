#!/bin/sh

#######################
# Deploy code to ec2
########################

source $(dirname $0)/settings.sh

echo "building docs ..."
rake
echo "done."

echo ""
echo ""

echo "deploying ..."
s3cmd -c $path_to_config put build/* --recursive --acl-public s3://developers.vestorly.com/
echo "done."



# echo "compressing assets ..."
# tar cvzf build.tar.gz build/
# echo "done ."
#
# echo ""
# echo ""
#
# echo "copying assets to ec2 ..."
# scp build.tar.gz $server:
# echo "done."
#
# echo ""
# echo ""
#
# echo "deloying & unpacking ..."
# ssh $server 'tar xvf build.tar.gz'
# ssh $server 'rm -f build.tar.gz'
# echo "done."