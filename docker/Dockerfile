FROM ruby:2.5.1 as BUILD

RUN apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./Gemfile /app/Gemfile
COPY ./lib /app/lib/
COPY ./config.rb /app/config.rb
COPY ./src /app/source/

RUN cd /app/ && bundle install

RUN cd /app/ && bundle exec middleman build --clean

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
