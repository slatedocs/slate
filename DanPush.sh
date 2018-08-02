#!/usr/bin/env bash

if [[ $1 ]]; then

	suredbits_web_dir=~/IdeaProjects/SuredBits-Web/

	cd "$suredbits_web_dir"
	git checkout new_slate
	git commit -am "$1"
	git push gitlab new_slate
else
	echo "Don't forget a commit message! Try again."
fi
