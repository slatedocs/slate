FROM ruby:2.3-alpine
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  && rm -rf /var/cache/apk/*
ADD Gemfile /tmp
ADD Gemfile.lock /tmp
WORKDIR /tmp
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app
EXPOSE 4567
CMD ["bundle", "exec", "middleman","server"]
