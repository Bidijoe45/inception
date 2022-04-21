NAME=inception

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml
COMPOSE = docker-compose -f $(DOCKER_COMPOSE_FILE)

all: $(NAME)

$(NAME): create_volumes_folders build up

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

create_volumes_folders:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

down:
	$(COMPOSE) down

clean:
	docker container prune -f

clean_volume:
	docker volume rm $$(docker volume ls -q)

fclean:
	docker system prune -f

re:	build up
