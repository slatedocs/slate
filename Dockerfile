FROM ruby:2.1.2

RUN apt-get update
#RUN apt-get install -yq ruby ruby-dev build-essential git
# nodejs: javascript run time
RUN apt-get install -yq nodejs
#RUN gem install --no-ri --no-rdoc bundler

ENV INSTALL_PATH /app

WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
ADD Gemfile* $INSTALL_PATH/
ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

#EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server"]
