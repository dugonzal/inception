# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/16 08:47:48 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/16 09:01:13 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from  alpine:3.18

LABEL author="dugonzal" 

run  apk add && apk update --no-cache
run  apk upgrade && apk add curl tar php81 php81-fpm php81-mysqli zsh --no-cache

EXPOSE 9000

RUN curl -L  https://wordpress.org/latest.tar.gz | tar -xzv 

RUN mkdir -p /var/www/html

RUN mv wordpress/ /var/www/html/wordpress/

COPY  conf/wp-config-sample.php  /var/www/html/wordpress/wp-config.php


LABEL descriptionDemon="-D, --daemonize  -F, --nodaemonize force"

CMD php-fpm81 -DF
