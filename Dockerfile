FROM ruby:2.3-alpine
VOLUME /usr/src/app
EXPOSE 4567

WORKDIR /usr/src/app

RUN apk add --update nodejs g++ make

CMD bundle install && bundle exec middleman server --watcher-force-polling
