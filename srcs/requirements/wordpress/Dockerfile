FROM debian:bookworm

RUN apt update && apt upgrade -y && \
	apt install -y \
	php-fpm \
	php-mysql \
	curl \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

