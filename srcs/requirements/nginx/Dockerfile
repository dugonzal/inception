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

run apk add && apk update && apk upgrade --no-cache && apk add zsh nginx openssl zsh gettext --no-cache && rm -rf /var/cache/apk/*

EXPOSE 443

#RUN sed -i '/^http {/a daemon off;' /etc/nginx/nginx.conf

COPY  conf/nginx.conf /etc/nginx/nginx.conf 

COPY  conf/default.conf /etc/nginx/http.d/default.conf.template

STOPSIGNAL SIGQUIT

CMD zsh -c "envsubst < /etc/nginx/http.d/default.conf.template > /etc/nginx/http.d/default.conf && rm -rf /etc/nginx/http.d/default.conf.template && exec nginx -g 'daemon off;'"
