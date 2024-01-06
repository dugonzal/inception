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

RUN apk update && apk upgrade --no-cache && apk add mariadb=10.11.5-r0 mariadb-client=10.11.5-r0 zsh=5.9-r2 openrc=0.48-r0 --no-cache \
  && rm -rf /var/cache/apk/* && openrc

RUN mkdir -p /var/lib/mariadb && chown -R 777:777 /var/lib/mariadb

COPY conf/init.sql /docker-entrypoint-initdb.d/

COPY conf/my.cnf /etc/

RUN chown -R mysql:mysql /tmp/ && chmod -R 777 /tmp/ \
  && chmod 644 /docker-entrypoint-initdb.d/init.sql /etc/my.cnf

RUN mysql_install_db --verbose --user=mysql --datadir=/var/lib/mariadb/

WORKDIR /var/lib/mariadb/

USER mysql

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mariadb", "--init-file=/docker-entrypoint-initdb.d/init.sql"]
