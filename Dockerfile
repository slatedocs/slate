FROM docker.io/ubuntu:18.04

USER root

RUN apt-get update && \
    apt-get install -yq vim software-properties-common && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -yq ruby2.4 ruby2.4-dev && \
    apt-get install -yq pkg-config build-essential nodejs git libxml2-dev libxslt-dev && \
    apt-get autoremove -yq 

RUN gem2.4 install --no-ri --no-rdoc bundler

WORKDIR /usr/local/src

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . .

CMD bundle exec middleman server --watcher-force-polling --watcher-latency=1
