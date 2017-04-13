#! /bin/bash

set -e

function main {
    if [ "$TRAVIS_BRANCH" != "master" ]; then
        echo "Stop: we only publish the master branch"
        exit 0
    fi

    echo "Building..."
    rake build
    echo "Checking out gh-pages..."
    git checkout gh-pages
    git reset --hard
    echo "Moving built artifiacts..."
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
    echo "Committing them..."
    git commit -m "Updating gh-pages"
    echo "Push!"
    git push --quiet origin gh-pages > /dev/null 2>&1
}

main
