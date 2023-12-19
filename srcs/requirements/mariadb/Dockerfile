# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/18 00:11:49 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/19 20:05:34 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.5

RUN apk update && apk upgrade --no-cache

RUN apk add mariadb mariadb-client mariadb-common zsh openrc --no-cache && \
    rm -rf /var/cache/apk/*

EXPOSE 3306

RUN openrc

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY conf/my.cnf /etc/mysql/

COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql

RUN mysql_install_db --verbose --user=mysql --datadir=/var/lib/mysql

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/docker-entrypoint-initdb.d/init.sql"]

