NAME=inception

DOCKER_COMPOSE=srcs/docker-compose.yaml
NGINX=./srcs/nginx/.
MARIADB=./srcs/mariadb/.
WORDPRESS=./srcs/wordpress

all: $(NAME)

$(NAME):
	docker build -t nginx $(NGINX)
	docker build -t mariadb $(MARIADB) 
	docker build -t wordpress $(WORDPRESS)
	make -C ./srcs

stop:
	make stop -C ./srcs

down:
	make down -C ./srcs

up:
	make -C ./srcs

reup:
	make down -C ./srcs
	make -C ./srcs

re: down all
