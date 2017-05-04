FROM ruby:alpine

RUN apk add --update \
    g++ \
    make \
    nodejs \
    git \
    libxml2-dev \
    libxslt-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /src
COPY . /src

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

EXPOSE 4567

ENTRYPOINT ["/bin/ash", "-c", "bundle exec middleman server"]