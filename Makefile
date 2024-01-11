# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:03:32 by Dugonzal          #+#    #+#              #
#    Updated: 2024/01/11 16:11:14 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL 						:= /bin/zsh

#include srcs/.env/
#sudo ss -tulpn

volumeWordpress		:= /home/inception/data/wordpress 
volumeMariadb			:= /home/inception/data/mariadb

all:
	 mkdir -p /home/inception/data/wordpress 
	 mkdir -p /home/inception/data/mariadb
	 sudo docker-compose --env-file srcs/.env/ -f srcs/docker-compose.yml up --build --detach 

clean:
	sudo docker compose -f srcs/docker-compose.yml down  --volumes
	
fclean: clean 
	sh ./srcipts/cleanDocker.sh	
	sudo rm -rf  /home/inception/data/wordpress 
	sudo rm -rf /home/inception/data/mariadb

s:
	sudo docker ps 
	@printf '\n\n'
	sudo docker ps -aq 
	@printf '\n\n'
	sudo docker images

logs:
	sudo docker logs mariadb
	sudo docker logs nginx
	sudo docker logs wordpress 

show:
	sudo docker exec -it mariadb sh -c 'mariadb --socket=/tmp/mysqld.sock -e "SHOW DATABASES;"'

status: s 
	sudo docker-compose -f srcs/docker-compose.yml config
	@printf '\n\n'
	@printf '\n\n'
	sudo docker ps -a --filter "publish=443"
	@printf '\n\n'
	sudo docker ps -a --filter "publish=80"
	
	@printf '\n\n'
	sudo docker-compose -f srcs/docker-compose.yml logs
	@printf '\n\n'
	docker volumes ls 
	@printf '\n\n'
	docker Networks ls

ip:
	sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${ip}

ps:
	sudo docker compose -f srcs/docker-compose.yml ps

logs:
	sudo docker logs ${c}

re: clean all

port:
	sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
	sudo firewall-cmd --reload

portDefault:
	sudo firewall-cmd --complete-reload
	sudo firewall-cmd --set-default-zone=drop
	sudo firewall-cmd --permanent --set-default-zone=drop
	sudo firewall-cmd --reload
	sudo firewall-cmd --list-all


## leraning

# sudo docker cp <container:<ruta> <folder host>
