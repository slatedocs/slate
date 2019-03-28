FROM ubuntu:16.04

WORKDIR /app

RUN \
  apt-get -y update && \
  apt-get -y install software-properties-common zlib1g-dev && \
  apt-add-repository ppa:brightbox/ruby-ng && \
  apt-get -y update && \
  apt-get -y install ruby2.4 ruby2.4-dev && \
  apt-get -y install -yq pkg-config build-essential nodejs git libxml2-dev libxslt-dev && \
  apt-get autoremove -yq

RUN gem2.4 install --no-ri --no-rdoc bundler

COPY Gemfile Gemfile
COPY gitconfig ~/.gitconfig

RUN \
  cd /app && \
  gem install sass -v '3.4.23' --source 'https://rubygems.org/' && \
  gem install nokogiri -v '1.8.4' --source 'https://rubygems.org/' && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle install

#ENTRYPOINT ["bundle exec middleman server --watcher-force-polling --watcher-latency=1 &> ~/middleman.log &"]