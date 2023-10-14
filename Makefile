all:
	sudo docker compose up --build 

clean:
	sudo docker compose down 

fclean:clean 

re: fclean all 
