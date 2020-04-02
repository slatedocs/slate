FROM ruby:2.5-alpine

RUN apk --no-cache add \
        g++ \
        gcc \
        libc-dev \
        make \
        nodejs \
    && gem install bundler

WORKDIR /srv/slate

COPY . /srv/slate

RUN bundle install

VOLUME /srv/slate/source

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
