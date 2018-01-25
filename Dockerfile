FROM ruby:2.3-alpine
RUN apk add --update nodejs g++ make
RUN mkdir /slate
WORKDIR /slate

COPY ./Gemfile ./Gemfile.lock /slate/
RUN bundle install
ADD ./ /slate

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
EXPOSE 4567
