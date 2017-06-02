FROM alpine:latest

MAINTAINER Lypitkas Konstantinos <klipitkas@gmail.com>

RUN echo "ipv6" >> /etc/modules

RUN apk --update add bash curl apache2 php7-apache2 apache2-utils \
    php7-xml php7-json php7-curl php7-zip php7-gd php7-mbstring \
    php7-pdo php7-pdo_mysql php7-session php7-mysqli php7-mcrypt \
    php7-tokenizer php7-openssl php7-mysqli php7-phar php7-simplexml \
    php7-ctype

RUN rm -rf /var/cache/apk/*
RUN mkdir -p /run/apache2
RUN mkdir -p /opt/utils

EXPOSE 80 443

ADD apache.sh /opt/utils/

RUN chmod +x /opt/utils/apache.sh

ENTRYPOINT ["/opt/utils/apache.sh"]
