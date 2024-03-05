DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all: setup
	@$(DOCKER_COMPOSE) up

built:
	@$(DOCKER_COMPOSE) up --build

start:
	@$(DOCKER_COMPOSE) start

setup:
	@mkdir -p /home/jlebre/data/wp; \
	mkdir -p /home/jlebre/data/db

fclean:
	@if [ -n "$$(docker ps -q)" ]; then \
		$(DOCKER_COMPOSE) down; \
	fi; \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null; \
	rm -rf /home/jlebre/data;

re: fclean all

.PHONY: all, built, setup, fclean, re

# docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null;