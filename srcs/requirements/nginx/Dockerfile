# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:04:21 by Dugonzal          #+#    #+#              #
#    Updated: 2023/10/20 16:50:24 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.16

run apk add && apk update && apk upgrade --no-cache && apk add zsh nginx openssl  openrc --no-cache

workdir /nginx

env SHELL=/bin/zsh 


COPY requirements/nginx .

#CMD zsh tools/main.sh
