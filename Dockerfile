FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential
RUN gem install --no-ri --no-rdoc bundler
RUN mkdir /app
RUN mkdir /app/vendor
RUN mkdir /app/vendor/bundle
WORKDIR /app
ADD ./bundle.config /root/.bundle/config
ADD ./Gemfile /app/Gemfile
ADD ./Gemfile.lock /app/Gemfile.lock
WORKDIR /app
EXPOSE 4567
CMD ["bundle", "exec", "middleman", "server"]
