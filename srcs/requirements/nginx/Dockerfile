# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:04:21 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/14 18:33:25 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.16

run apk add && apk update && apk upgrade --no-cache && apk add zsh nginx openssl tree certbot openrc zsh --no-cache

EXPOSE 443

ENV SHELL=/bin/zsh 

#RUN  rm -rf /etc/nginx/nginx.conf

#RUN sed -i '/^http {/a daemon off;' /etc/nginx/nginx.conf

COPY  conf/nginx.conf /etc/nginx/nginx.conf 
COPY  conf/default.conf /etc/nginx/http.d/default.conf 


CMD ["nginx", "-g", "daemon off;"]
