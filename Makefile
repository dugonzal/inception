# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Dugonzal <dugonzal@student.42urduliz.com>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/14 11:03:32 by Dugonzal          #+#    #+#              #
#    Updated: 2023/12/21 23:09:37 by Dugonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL 				:= /bin/zsh

volumeWordpress		:= /home/ciclo/Documentos/42/inception/srcs/requirements/wordpress/wordpressVolume/
volumeMariadb		:= /home/ciclo/Documentos/42/inception/srcs/requirements/mariadb/mariadbVolume/

all:
	 mkdir -p ${volumeMariadb}
	 mkdir -p ${volumeWordpress}
	sudo docker compose --file srcs/docker-compose.yml up --build --detach 
clean:
	sudo docker compose -f srcs/docker-compose.yml down  --volumes
	
fclean: clean 
	sh ./srcipts/cleanDocker.sh	
	sudo rm -rf srcs/requirements/wordpress/wordpressVolume/*
	sudo rm -rf srcs/requirements/mariadb/mariadbVolume/*
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
	sudo docker exec -it mariadb sh -c 'mariadb --socket=/tmp/mysql.sock -e "SHOW DATABASES;"'


status: s 
	sudo docker-compose -f srcs/docker-compose.yml config
	@printf '\n\n'
	@printf '\n\n'
	sudo docker ps -a --filter "publish=443"
	@printf '\n\n'
	sudo docker ps -a --filter "publish=80"
	
	@printf '\n\n'
	sudo docker-compose -f srcs/docker-compose.yml logs

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
