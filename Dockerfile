FROM ruby:2-alpine
MAINTAINER Robert Lord <hello@lord.io>
WORKDIR /app
EXPOSE 4567

### install system packages
RUN apk update && apk add --no-cache \
    build-base \
    nodejs \
    libxml2 \
    libxml2-dev

### install required gems
COPY Gemfile* /app/
RUN bundle install

### copy in entire app last
COPY . /app/

### execute development server (better way for official docker?)
CMD [ \   
    "bundle", \
    "exec", \
    "middleman", \
    "server", \
    "--watcher-force-polling", \
    "--watcher-latency=1" \
]
