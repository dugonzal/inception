# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:04:21 by Dugonzal          #+#    #+#              #
#    Updated: 2023/10/14 19:34:10 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from alpine:3.16

run apk add && apk update && apk upgrade && apk add zsh nginx openssl neofetch

run mkdir /nginx


env SHELL=/bin/zsh 

workdir /nginx

COPY ./requirements/nginx .

CMD zsh main.sh
