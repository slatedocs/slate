FROM ruby:2.3.4

RUN apt-get update -qq

RUN apt-get install -y \
  build-essential \
  libxml2-dev \
  libxslt1-dev \
  nodejs

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/
RUN gem install bundler --no-ri --no-rdoc
RUN bundle install

COPY . /usr/src/app

EXPOSE 4567

CMD bundle exec middleman server -p 4567 --watcher-force-polling --watcher-latency=1 --verbose
