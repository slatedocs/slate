FROM ruby:2.5.1

COPY . /usr/src/app
VOLUME /usr/src/app

WORKDIR /usr/src/app

EXPOSE 4567

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN bundle install

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
