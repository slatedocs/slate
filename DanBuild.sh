#!/usr/bin/env bash

echo "Warning: This script is for use with simple changes only!"

slate_dir=~/dev/slate
suredbits_web_dir=~/IdeaProjects/SuredBits-Web/

cd "$suredbits_web_dir"
git checkout gitlab-master
git fetch
git pull
if [[ `git branch --list new_slate` ]]; then
   	git checkout new_slate
else
	git checkout -b new_slate
fi

git rebase gitlab-master

cd "$slate_dir"
bundle exec middleman build --clean

lines="221,$(wc -l < build/index.html)p"
new_index="$(sed -n "$lines" build/index.html)"
new_index_fixed="$(sed -e 's/@/@@/g' <<< "$new_index")"
cd "$suredbits_web_dir"
top="$(sed -n '1,232p' app/views/Slate_API_Docs.scala.html)"

echo "$top" > app/views/Slate_API_Docs.scala.html
echo "$new_index_fixed" >> app/views/Slate_API_Docs.scala.html

echo ""
echo "Changes have been made to SuredBits-Web project"
echo "Test for errors using 'sbt run' at $suredbits_web_dir"
echo "If everything looks good and your changes are there, run 'bash DanPush.sh \"Commit message here\" ' to push to gitlab"
echo "Or, continue to make more changes and then run this script again"
