FROM ruby:2.4 AS build

RUN mkdir /app
WORKDIR /app

RUN apt-get update && \
    apt-get -y install git make gcc libc-dev g++

COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Everything above should be cached

COPY . /app
RUN bundle exec middleman build && \
    git log -n1 --pretty="Commit Date: %aD%nBuild Date: `date --rfc-2822`%n%h %an%n%s%n" > build/round-table.txt && \
    rm -rf /app/.git

FROM nginx:alpine
MAINTAINER Quintype Developers <dev-core@quintype.com>
EXPOSE 3000

RUN mkdir -p /app
WORKDIR /app

COPY site.conf /etc/nginx/conf.d/documentation.conf

# Everything above should be cached

COPY --from=build /app/build /app/public
