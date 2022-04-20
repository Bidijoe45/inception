NAME=inception

DOCKER_COMPOSE_DIR=./srcs/
NGINX=./srcs/nginx
MARIADB=./srcs/mariadb
WORDPRESS=./srcs/wordpress

all: $(NAME)

$(NAME): create_volumes_folders up

up:
	docker-compose up -df $(DOCKER_COMPOSE_DIR)

create_volumes_folders:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

down:
	docker-compose down -f srcs/

clean:
	docker container prune -f

fclean:
	docker system prune -f

re: 
