# Edit ENV variables to match your 42 login
LOGIN = jlebre

# Docker-compose command
DOCKER_COMPOSE = LOGIN=${LOGIN} docker-compose -f ./srcs/docker-compose.yml

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

# Add ${LOGIN}.42.fr to hosts file
# Create data directory
setup:
	if ! grep -q "${LOGIN}.42.fr" /etc/hosts; then
		@echo "127.0.0.1 ${LOGIN}.42.fr" | sudo tee -a /etc/hosts
	fi
	if ! grep -q "${LOGIN}.42.fr" /etc/hosts; then
		@echo "127.0.0.1 www.${LOGIN}.42.fr" | sudo tee -a /etc/hosts
	fi
	@sudo mkdir -p /home/${LOGIN}
	@sudo mkdir -p /home/${LOGIN}/data
	@sudo mkdir -p /home/${LOGIN}/data/wp
	@sudo mkdir -p /home/${LOGIN}/data/db

# Remove data directory
clean:
	@sudo rm -rf /home/${LOGIN}/data

# Remove data directory and docker volumes
# Remove ${LOGIN}.42.fr from hosts file
fclean: clean
	@sudo sed -i '' '/${LOGIN}.42.fr/d' /etc/hosts
	@sudo sed -i '' '/www.${LOGIN}.42.fr/d' /etc/hosts
	docker system prune -a -f --volumes
	docker volumes rm srcs_db_data srcs_wp_data

# Phony targets
.PHONY: all, up, down, stop, start, setup, clean, fclean