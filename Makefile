all:
	docker build -t nginx-image ./srcs/requirements/nginx
#sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:

fclean: clean

re: fclean all

a:	re
	./inception

.PHONY: all, clean, fclean, re, a