#! /bin/bash

set -e

function main {
    if [ "$TRAVIS_BRANCH" != "master" ]; then
        echo "Stop: we only publish the master branch"
        exit 0
    fi

    rake build
    git checkout gh-pages
    git reset --hard
    rm -rf fonts
    rm -rf javascripts
    rm -rf images
    rm -rf stylesheets
    rm -rf examples
    mv build/* .
    git add fonts
    git add javascripts
    git add images
    git add stylesheets
    git add examples
    git add index.html
    git commit -m "Updating gh-pages"
    git push
}

main
