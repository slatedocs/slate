FROM ruby:2.2.2

RUN apt-get update && apt-get install -y nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install

ADD nginx /etc/nginx
ADD . /usr/src/app

RUN git init && bundle exec rake build && cp -r build/* /usr/share/nginx/html
