NAME=inception

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yaml
COMPOSE = docker-compose -f $(DOCKER_COMPOSE_FILE)

all: $(NAME)

$(NAME): create_data_folders build up

build:
	$(COMPOSE) build --parallel

up:
	$(COMPOSE) up -d

create_data_folders:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

down:
	$(COMPOSE) down -v

clean:
	docker container prune -f

fclean: down
	docker system prune -f

re:	build up
