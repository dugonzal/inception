# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/18 00:11:49 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/18 20:14:16 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.18

RUN apk update && apk upgrade --no-cache

RUN apk add mariadb mariadb-client mariadb-common zsh openrc  --no-cache && \
	rm -rf /var/cache/apk/*

EXPOSE 3306

LABEL estatament="hay que usar /etc/init.d/mariadb y hacer un setup de mariadb \
tambien hay que crear un archivo en  * touch /run/openrc/softlevel"


RUN openrc

copy conf/my.conf /etc/mysql/my.conf

RUN touch /run/openrc/softlevel

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql 

ADD conf/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod +xr /docker-entrypoint-initdb.d/

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --init-file=/docker-entrypoint-initdb.d/init.sql

STOPSIGNAL SIGTERM

CMD  /usr/share/mariadb/mysql.server start && rc-service mariadb start
