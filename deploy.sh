#! /bin/bash

if [ "${TRAVIS_BRANCH}" = "master"  -a "${TRAVIS_PULL_REQUEST}" = "false" ]
then
  echo "Push generated dist folder"
  git config --global user.email "support@kuzzle.io"
  git config --global user.name "Travis CI"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG} travis-build
  cp -rp build/* travis-build/ && cd travis-build
  git commit -am "Travis CI auto-merge from travis build ${TRAVIS_BUILD_NUMBER}"
  git push -fq origin gh-pages
fi

exit 0
