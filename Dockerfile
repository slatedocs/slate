FROM ruby:2.6-buster as builder

WORKDIR /tmp/api-docs
ADD . .
RUN apt update && \
    apt install -y nodejs && \
    gem install bundler -v 1.15.4 && \
    bundle install && \
    bundle exec middleman build --clean

FROM nginx
COPY --from=builder /tmp/api-docs/build /usr/share/nginx/html
