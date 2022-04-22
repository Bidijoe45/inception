NAME=inception

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml
COMPOSE = docker-compose -f $(DOCKER_COMPOSE_FILE)

all: $(NAME)

$(NAME): create_data_folders build up

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

create_data_folders:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

delete_data_folders:
	rm -rf ~/data

down:
	$(COMPOSE) down -v

clean:
	docker container prune -f

fclean: down delete_data_folders
	docker system prune -f

re:	build up
