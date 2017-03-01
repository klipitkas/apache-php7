FROM alpine:latest

MAINTAINER Lypitkas Konstantinos <klipitkas@gmail.com>

RUN echo "ipv6" >> /etc/modules

RUN apk update
RUN apk upgrade
RUN apk add curl
RUN apk add apache2
RUN apk add php7-apache2
RUN apk add apache2-utils
RUN apk add php7-xml
RUN apk add php7-json
RUN apk add php7-curl
RUN apk add php7-zip
RUN apk add php7-gd
RUN apk add php7-mbstring

RUN mkdir -p /run/apache2
EXPOSE 80 443
VOLUME ["/var/www/localhost/htdocs"]
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
