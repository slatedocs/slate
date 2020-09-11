FROM ruby:2.3-alpine
COPY . /usr/src/app
VOLUME /usr/src/app
EXPOSE 4567

WORKDIR /usr/src/app

RUN apk add --update nodejs g++ make
RUN bundle install

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]