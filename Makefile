# Docker-compose command
DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

# Default target
all: up

# Up docker-compose
up: setup
	@$(DOCKER_COMPOSE) up

build:
	@$(DOCKER_COMPOSE) up -d --build

# Down docker-compose
down:
	@$(DOCKER_COMPOSE) down

# Start docker-compose
start:
	@$(DOCKER_COMPOSE) start

# Add jlebre.42.fr to hosts file
# Create data directory
setup:
	@if ! grep -q "jlebre.42.fr" /etc/hosts; then \
		echo "127.0.0.1 jlebre.42.fr" | tee -a /etc/hosts; \
	fi
	@if ! grep -q "www.jlebre.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.jlebre.42.fr" | tee -a /etc/hosts; \
	fi
	@mkdir -p /home/jlebre/data/wp
	@mkdir -p /home/jlebre/data/db

# Remove data directory
clean:
	@rm -rf /home/jlebre/data

# Remove data directory and docker volumes
# Remove jlebre.42.fr from hosts file
fclean:clean
	@sed -i'' '/jlebre\.42\.fr/d' /etc/hosts
	@sed -i'' '/www\.jlebre\.42\.fr/d' /etc/hosts
	@docker system prune -a -f --volumes
	@if docker volume inspect srcs_db_data >/dev/null 2>&1; then \
		docker volume rm srcs_db_data; \
	fi
	@if docker volume inspect srcs_wp_data >/dev/null 2>&1; then \
		docker volume rm srcs_wp_data; \
	fi
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q)

re: fclean all

# Phony targets
.PHONY: all, up, build, down, start, setup, clean, fclean, re