# Docker-compose command
DOCKER_COMPOSE = DOCKER_BUILDKIT=0 docker-compose -f ./srcs/docker-compose.yml

# Default target
all: up

# Up docker-compose
up: setup
	@${DOCKER_COMPOSE} up -d --build

# Down docker-compose
down:
	@${DOCKER_COMPOSE} down

# Start docker-compose
start:
	@${DOCKER_COMPOSE} start

# Stop docker-compose
stop:
	@${DOCKER_COMPOSE} stop

# Add jlebre.42.fr to hosts file
# Create data directory
setup:
	@if ! grep -q "jlebre.42.fr" /etc/hosts; then \
		echo "127.0.0.1 jlebre.42.fr" | tee -a /etc/hosts; \
	fi
	@if ! grep -q "www.jlebre.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.jlebre.42.fr" | tee -a /etc/hosts; \
	fi
	@mkdir -p /home/jlebre
	@mkdir -p /home/jlebre/data
	@mkdir -p /home/jlebre/data/wp
	@mkdir -p /home/jlebre/data/db

# Remove data directory
clean:
	@rm -rf /home/jlebre/data

# Remove data directory and docker volumes
# Remove jlebre.42.fr from hosts file
fclean: stop clean
	@sed -i'' '/jlebre\.42\.fr/d' /etc/hosts
	@sed -i'' '/www\.jlebre\.42\.fr/d' /etc/hosts
	@docker system prune -a -f --volumes
	@if docker volume inspect srcs_db_data >/dev/null 2>&1; then \
		docker volume rm srcs_db_data; \
	fi
	@if docker volume inspect srcs_wp_data >/dev/null 2>&1; then \
		docker volume rm srcs_wp_data; \
	fi

re: fclean all

# Phony targets
.PHONY: all, up, down, stop, start, setup, clean, fclean, re