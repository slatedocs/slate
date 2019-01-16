FROM ruby:2.3-slim

RUN apt-get update && \
    apt-get install -y build-essential nodejs

WORKDIR /api.electionbuddy.com

COPY Gemfile /api.electionbuddy.com/Gemfile
COPY Gemfile.lock /api.electionbuddy.com/Gemfile.lock

RUN bundle install

ENTRYPOINT ["bundle", "exec", "middleman", "server"]
