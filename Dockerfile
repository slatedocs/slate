FROM ruby:2.3
MAINTAINER Carlos Feliciano-Barba <carlos.feliciano@cometa.works>

ENV APP_HOME /usr/src/app/source

VOLUME $APP_HOME

RUN apt-get update && \
    apt-get install -y \
    nodejs

WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=20

RUN bundle install

CMD ["bundle", "exec", "middleman", "server", "--force-polling"]
EXPOSE 4567
