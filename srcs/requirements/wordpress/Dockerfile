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

run  apk add && apk update --no-cache
run  apk upgrade && apk add --no-cache php81 php81-fpm php81-mysqli php81-json php81-openssl php81-curl php81-zlib php81-xml php81-phar curl tar mysql-client openrc \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

RUN mkdir -p /var/www/html

RUN curl -L  https://wordpress.org/wordpress-6.4.2.tar.gz | tar -xzv &&  mv wordpress/ /var/www/html/wordpress/

COPY  conf/wp-config-sample.php  /var/www/html/wordpress/wp-config.php

# deberia configurar 
LABEL descriptionDemon="-D, --daemonize  -F, --nodaemonize force"

WORKDIR /var/www/html/wordpress/

CMD   php -S 0.0.0.0:9000
#CMD php-fpm81 --daemonize --nodaemonize -c /etc/php81/php-fpm.d/www.conf
