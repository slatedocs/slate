FROM ruby:2.2.3-onbuild

RUN ln -s /usr/src/app /app # Deprecated

EXPOSE 4567
CMD ["bundle", "exec", "middleman", "server", "--force-polling"]
