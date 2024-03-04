###################
#                 #
#    MAKEFILE     #
#                 #
###################

LOGIN = jlebre
ENV = LOGIN=$(LOGIN)
#───────────────────────────────────────────────────────────────────────#
# Change the login.                                                     #  
#_______________________________________________________________________#

DOCKER_COMPOSE = $(ENV) docker-compose -f ./srcs/docker-compose.yml
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
	@if ! grep -q "$(LOGIN).42.fr" /etc/hosts; then \
		echo "127.0.0.1 $(LOGIN).42.fr" | tee -a /etc/hosts; \
	fi
	@if ! grep -q "www.$(LOGIN).42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.$(LOGIN).42.fr" | tee -a /etc/hosts; \
	fi
	@mkdir -p /home/$(LOGIN)/data/wp
	@mkdir -p /home/$(LOGIN)/data/db
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
	if [ -n "$$(docker ps -q)" ]; then \
		docker stop $$(docker ps -qa); \
		docker rm $$(docker ps -qa); \
	fi
	if [ -n "$$(docker images -q)" ]; then \
		docker rmi -f $$(docker images -qa); \
	fi
	if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	if [ -n "$$(docker network ls -q)" ]; then \
		docker network rm $$(docker network ls -q) 2>/dev/null; \
	fi
	@rm -rf $(HOME)/data/wordpress
	@rm -rf $(HOME)/data/mariadb
	@rm -rf /home/$(LOGIN)/data
	@sed -i'' '/$(LOGIN)\.42\.fr/d' /etc/hosts
	@sed -i'' '/www\.$(LOGIN)\.42\.fr/d' /etc/hosts
#───────────────────────────────────────────────────────────────────────#
# Remove "data" directory and docker volumes inside.                    #
# Remove login.42.fr from hosts file.                                   #
#_______________________________________________________________________#

.PHONY: all, setup, clean, fclean
#───────────────────────────────────────────────────────────────────────#
# Phony targets.                                                        #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################

# docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null;