FROM ruby:2.5.1 as build
WORKDIR /usr/app

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

ADD . .

RUN bundle install
RUN bundle exec middleman build --clean

FROM node:8-alpine
WORKDIR /usr/app

ADD server/package-lock.json package-lock.json
ADD server/package.json package.json
ADD server/ .

RUN npm i

COPY --from=build /usr/app/build build

EXPOSE 4567
CMD ["node", "server.js"]