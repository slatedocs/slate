# To set up slate on devbox:

## Clone repo
git clone git@github.com:shiftboard/slate

## Install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

## Install Ruby and other required dev headers
sudo apt-get install ruby-all-dev libxslt-dev

## Install Node.js
sudo apt-get install -y nodejs

## Install bundler
sudo gem install bundler

## Install required bundles
cd slate
bundle install

## Run middleman server
bundle exec middleman server

## View site
http://192.168.10.10:4567/
