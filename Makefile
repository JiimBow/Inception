NAME = inception

DATA_PATH = /home/jodone/data

COMPOSE = docker compose -f srcs/docker-compose.yml

all: create_dirs
	$(COMPOSE) up --build -d

create_dirs:
	mkdir -p $(DATA_PATH)/mariadb
	mkdir -p $(DATA_PATH)/wordpress

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -rf /home/jodone/data/mariadb/*
	sudo rm -rf /home/jodone/data/wordpress/*

re: fclean all