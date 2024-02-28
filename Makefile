# Add jlebre.42.fr to hosts file
# Start docker-compose
all: up

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

# Stop docker-compose
down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

.PHONY: all, up, build, down, stop, start, re