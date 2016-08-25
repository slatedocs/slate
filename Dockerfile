FROM ruby:latest
EXPOSE 4567

RUN apt-get update \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock config.rb /usr/src/app/

RUN bundle config --global frozen 1 \
  && bundle install

COPY source /usr/src/app/source

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]
