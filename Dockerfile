FROM ruby:2.6.2 as build

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN bundle install && bundle exec middleman build --clean


FROM opsline/tools:alpine AS tools

FROM node:9.11.1-alpine as app

WORKDIR /usr/src/app
COPY ./yarn.lock .
COPY ./package.json .
COPY ./src ./src
RUN yarn
COPY --from=tools /usr/local/bin/chalk /usr/local/bin/
COPY --from=build /usr/src/app/build /usr/src/app/build


COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER nobody
ENTRYPOINT ["/entrypoint.sh"]
