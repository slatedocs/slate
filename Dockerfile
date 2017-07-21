FROM ruby:2.4 
RUN apt-get update
RUN apt-get install -yq pkg-config build-essential nodejs git libxml2-dev libxslt-dev
RUN gem install --no-ri --no-rdoc bundler
RUN bundle config build.nokogiri --use-system-libraries
ENV APP_HOME /slate
WORKDIR $APP_HOME
ADD . $APP_HOME/
RUN bundle install