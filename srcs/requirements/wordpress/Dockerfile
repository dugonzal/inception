from  alpine:3.16

LABEL author="dugonzal" 

run  apk add && apk update --no-cache
run  apk upgrade && apk add curl tar php8 php8-fpm php8-mysqli --no-cache

EXPOSE 9000

RUN curl -L  https://wordpress.org/latest.tar.gz | tar -xzv 

RUN mkdir -p /var/www/html

RUN mv wordpress/ /var/www/html/wordpress

CMD php-fpm8 -ES
