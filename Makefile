# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:03:32 by Dugonzal          #+#    #+#              #
#    Updated: 2023/10/14 19:17:53 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL := /bin/zsh

all:
	#cd srcs; sudo docker compose up --build 
	sudo docker compose --file srcs/docker-compose.yml up --build 

clean:
	sudo docker compose -f srcs/docker-compose.yml down 

fclean: clean 

ps:
	sudo docker compose -f srcs/docker-compose.yml ps

re: fclean all 
