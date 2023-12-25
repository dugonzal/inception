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

FROM alpine:3.18

RUN apk update && apk upgrade --no-cache

RUN apk add mariadb mariadb-client zsh openrc --no-cache && \
    rm -rf /var/cache/apk/*

RUN openrc

RUN mkdir -p /var/lib/mysqld && chown -R 777:777 /var/lib/mysqld

COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql
COPY conf/my.cnf /etc/

RUN chmod 644 /docker-entrypoint-initdb.d/init.sql /etc/my.cnf

RUN mysql_install_db --verbose --user=mysql --datadir=/var/lib/mysqld

WORKDIR /var/lib/mysqld/

USER mysql

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysqld", "--init-file=/docker-entrypoint-initdb.d/init.sql"]
