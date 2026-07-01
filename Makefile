NAME = inception

COMPOSE = docker compose -f srcs/docker-compose.yml

all:
	$(COMPOSE) up --build -d

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

fclean: clean
	docker system prune -af --volumes

re: fclean all