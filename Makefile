# Add jlebre.42.fr to hosts file
# Start docker-compose
all:
	@sudo sh -c 'echo "127.0.0.1 jlebre.42.fr" >> /etc/hosts'
	@echo -e '\033[1;32mAdded jlebre.42.fr to hosts file\033[0m'
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

# Stop docker-compose
clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down \
	--rmi all -v

# Remove jlebre.42.fr from hosts file
# Remove wordpress and mariadb data
fclean: clean
	@sudo sed -i '/127.0.0.1 jlebre.42.fr/d' /etc/hosts
	@echo -e '\033[1;31mRemoved jlebre.42.fr from hosts file\033[0m'
	@if [ -d "/home/jlebre/data/wordpress" ]; then \
		sudo rm -rf /home/jlebre/data/wordpress/*; \
	fi
	@if [ -d "/home/jlebre/data/mariadb" ]; then \
		sudo rm -rf /home/jlebre/data/mariadb/*; \
	fi

# Clean and start docker-compose
re: fclean all

.PHONY: all, clean, fclean, re