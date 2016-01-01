FROM ruby:onbuild
MAINTAINER Adrian Perez <adrian@adrianperez.org>
EXPOSE 4567
VOLUME /usr/src/app/source
CMD ["bundle", "exec", "middleman", "server", "--force-polling"]
