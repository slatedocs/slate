FROM ruby:2.5.1 as base
MAINTAINER David Arena <david.andrew.arena@gmail.com>
RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

ADD . /app
WORKDIR /app

RUN bundle install

CMD ["bundle", "exec", "middleman", "build", "--clean"]

FROM nginx:alpine
COPY --from=base /app/build /usr/share/nginx/html


