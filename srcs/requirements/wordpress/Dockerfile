# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/16 08:47:48 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/19 13:43:44 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.5

LABEL author="dugonzal" 

RUN  apk add && apk update --no-cache
RUN  apk upgrade && apk add --no-cache php81 php81-fpm php81-mysqli  php81-mbstring \
  php81-json php81-openssl php81-curl php81-zlib php81-xml php81-phar php81-cgi curl tar mysql-client zsh\
  && rm -rf /var/cache/apk/*

EXPOSE 9000

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

RUN wp core download --url=https://wordpress.org/wordpress-6.4.2.tar.gz --locale=es_ES --path=/var/www/html/wordpress

#ADD ./conf/php.ini /etc/php81/

RUN rm -rf /var/www/html/wordpress/wp-config.php

RUN chmod 777 /var/www/html/wordpress/
# deberia configurar 
LABEL descriptionDemon="-D, --daemonize  -F, --nodaemonize force"

WORKDIR /var/www/html/wordpress/

ADD tools/main.sh /tmp 

RUN chmod +x /tmp/main.sh

RUN adduser -S nginx && addgroup -S nginx

CMD zsh /tmp/main.sh
#CMD php-fpm81 --nodaemonize -c /etc/php81/php-fpm.d/www.conf
