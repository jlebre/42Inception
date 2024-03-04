###################
#                 #
#    MAKEFILE     #
#                 #
###################

DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml
#───────────────────────────────────────────────────────────────────────#
# docker-compose is used to define and run Docker containers.           #
# "-f ./srcs/docker-compose.yml" provides the path to the YAML file.    #
#_______________________________________________________________________#

all: setup
	@$(DOCKER_COMPOSE) up --build
#───────────────────────────────────────────────────────────────────────#
# The "up" target is responsible for bringing up the Docker containers. #
# Instructs Docker Compose to create and start containers for           #
# all services defined in the docker-compose.yml file                   #
#_______________________________________________________________________#

setup:
	@mkdir -p /home/jlebre/data/wp; \
	mkdir -p /home/jlebre/data/db
#───────────────────────────────────────────────────────────────────────#
# Checks whether login.42.fr already exists, if it does not exist       #
# adds login.42.fr and www.login.42.fr to hosts file.                   #
# 127.0.0.1 maps the hostname to the local machine itself.              #
# Used to simulate the behavior of a server without actually accessing  #
# external network resources.                                           #
# "tee" reads from the stdin and writes to both stdout and one or       #
# more files. "-a" is used to append the output to the specified file.  #
#                                                                       #
# Create data directory (were the volumes will be available)            #
# "db" is a volume that contains Wordpress database.                    #
# "wp" is a volume that contains Wordpress website files.               #
#_______________________________________________________________________#

fclean:
	@if [ -n "$$(docker ps -q)" ]; then \
		$(DOCKER_COMPOSE) down; \
	fi; \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null; \
	rm -rf /home/jlebre/data;
#───────────────────────────────────────────────────────────────────────#
# Remove "data" directory and docker volumes inside.                    #
#_______________________________________________________________________#

re: fclean all
#───────────────────────────────────────────────────────────────────────#
# Rebuild the project.                                                 #
#_______________________________________________________________________#

.PHONY: all, setup, fclean, re
#───────────────────────────────────────────────────────────────────────#
# Phony targets.                                                        #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################

# docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null;