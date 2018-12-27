FROM ruby:2.5.1
MAINTAINER ME

WORKDIR /slate

RUN apt-get update && apt-get install -y apt-utils nodejs
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 4567
CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
