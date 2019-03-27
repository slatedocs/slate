FROM ruby:2.5.1

EXPOSE 4567

RUN apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./Gemfile /app/Gemfile
COPY ./lib /app/lib/
COPY ./config.rb /app/config.rb
COPY ./src /app/source/

RUN cd /app/ && bundle install

CMD cd /app/ && bundle exec middleman server --watcher-force-polling
