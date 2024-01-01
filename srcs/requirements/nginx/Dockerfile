# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:04:21 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/19 13:43:35 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.5

RUN apk add && apk update && apk upgrade --no-cache \
  && apk add zsh nginx openssl zsh gettext --no-cache && rm -rf /var/cache/apk/*

EXPOSE 443 

#RUN sed -i '/^http {/a daemon off;' /etc/nginx/nginx.conf
#USER nginx

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key \
  -out /etc/nginx/ssl/server.crt -days 365 -nodes -subj "/CN=dugonzal42.fr"

RUN chown  -R nginx:nginx /var/lib/nginx

COPY  conf/nginx.conf /etc/nginx/nginx.conf 

COPY  conf/default.conf /etc/nginx/http.d/default.conf.template

STOPSIGNAL SIGQUIT

CMD zsh -c "envsubst < /etc/nginx/http.d/default.conf.template > /etc/nginx/http.d/default.conf && rm -rf /etc/nginx/http.d/default.conf.template && exec nginx -g 'daemon off;'"
