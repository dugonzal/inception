# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/16 08:47:48 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/22 17:29:32 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.5

LABEL author="dugonzal" 

run  apk add && apk update --no-cache
run  apk upgrade && apk add curl tar php81 php81-fpm php81-mysqli zsh --no-cache && rm -rf /var/cache/apk/*

EXPOSE 9000

RUN mkdir -p /var/www/html

RUN curl -L  https://wordpress.org/wordpress-4.2.2.tar.gz | tar -xzv &&  mv wordpress/ /var/www/html/wordpress/

COPY  conf/wp-config-sample.php  /var/www/html/wordpress/wp-config.php

# deberia configurar 
LABEL descriptionDemon="-D, --daemonize  -F, --nodaemonize force"

CMD php-fpm81 --daemonize --nodaemonize
