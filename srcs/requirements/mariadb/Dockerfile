# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/18 00:11:49 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/18 13:06:30 by Dugonzal         ###   ########.fr        #
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

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql


RUN /usr/share/mariadb/mysql.server start

# Asegura los permisos del directorio del socket

#CMD sleep infinity 
CMD rc-service mariadb start
