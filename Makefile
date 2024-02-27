# Add jlebre.42.fr to hosts file
# Start docker-compose
all: up

up:
	@DOCKER_BUILDKIT=0 docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@DOCKER_BUILDKIT=0 docker-compose -f ./srcs/docker-compose.yml up --build -d

# Stop docker-compose
down:
	@docker-compose -f ./srcs/docker-compose.yml down \

# Clean and start docker-compose
re: down all

.PHONY: all, up, build, down, re