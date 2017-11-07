FROM nginx:alpine

EXPOSE 3000

RUN mkdir -p /app
COPY site.conf /etc/nginx/conf.d/documentation.conf

WORKDIR /app
ADD ./build /app
