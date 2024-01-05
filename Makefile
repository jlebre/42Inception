
NAME = inception

all: $(NAME)
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	rm -rf $(NAME)

fclean: clean

re: fclean all

a:	re
	./inception

.PHONY: all, clean, fclean, re, a