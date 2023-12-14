#! /bin/bash

container="$(sudo docker ps -aq)"

if [ -n "$container" ]; then
	sudo docker rm -f $container
else
	printf 'no hay contenedores que limpiar\n'
fi

images="$(sudo docker images -aq)"

if [ -n "$images" ]; then

	sudo docker rmi -f $images
fi
rm -rf /home/ciclo/data
#$(sudo docker volume ls -q) | xargs -n 1 echo sudo docker volume rm
#sudo docker network rm $(sudo docker network ls -q)
