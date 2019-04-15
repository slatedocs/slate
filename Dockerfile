FROM ruby:2.6.2

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN bundle install

USER nobody
CMD ["bundle", "exec", "middleman", "server"]
