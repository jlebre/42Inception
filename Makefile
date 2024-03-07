DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all: setup
	@$(DOCKER_COMPOSE) up -d

build:
	@$(DOCKER_COMPOSE) up -d --build

down:
	@$(DOCKER_COMPOSE) down

start:
	@$(DOCKER_COMPOSE) start

setup:
	@if [ ! -d "/home/jlebre/data" ]; then \
		mkdir -p /home/jlebre/data/wp; \
		mkdir -p /home/jlebre/data/db; \
	fi;

fclean:
	@if [ -n "$$(docker ps -q)" ]; then \
		$(DOCKER_COMPOSE) down; \
	fi; \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null; \
	rm -rf /home/jlebre/data;

logs:
	docker logs mariadb && docker logs wordpress

info:
	@echo "----------DOCKER PS----------" \
	docker ps \
	echo "----------NETWORKS----------" \
	docker network ls \
	echo "----------VOLUMES----------" \
	docker volume ls \
	echo "----------INSPECT DB----------" \
	docker volume inspect db \
	echo "----------INSPECT WP----------" \
	docker volume inspect wp \
	echo "----------ENSURE CONTAINERS WERE CREATED----------" \
	srcs/docker-compose ls

re: fclean all

.PHONY: all, build, down, start, setup, fclean, logs, info, re

# docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null;