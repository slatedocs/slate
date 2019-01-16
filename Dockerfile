FROM ruby:2.3-slim

RUN apt-get update && \
    apt-get install -y build-essential nodejs

WORKDIR /slate

COPY Gemfile /slate/Gemfile
COPY Gemfile.lock /slate/Gemfile.lock

RUN bundle install

ENTRYPOINT ["bundle", "exec", "middleman", "server"]
