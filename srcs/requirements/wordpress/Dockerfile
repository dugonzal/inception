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

RUN apk update --update && apk upgrade --no-cache && apk add --no-cache php81=8.1.26-r0 \
  php81-fpm=8.1.26-r0 php81-common=8.1.26-r0 php81-mysqli=8.1.26-r0 php81-mbstring=8.1.26-r0 \
  php81-json php81-openssl=8.1.26-r0 php81-curl php81-zlib php81-xml php81-phar php81-cgi curl=8.5.0-r0 \
  tar=1.34-r3 zsh=5.9-r2 && rm -rf /var/cache/apk/*

RUN mkdir -p /var/www/html/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar \
  && mv wp-cli.phar /bin/wp

RUN wp core download --url=https://wordpress.org/wordpress-6.4.2.tar.gz --locale=es_ES --path=/var/www/html/wordpress \
  && chmod 777 /var/www/html/wordpress/

COPY tools/main.sh /tmp/

RUN chmod +x /tmp/main.sh

COPY conf/www.conf /etc/php81/php-fpm.d/

WORKDIR /var/www/html/wordpress/

CMD ["zsh", "/tmp/main.sh"]
