FROM debian:bookworm

RUN apt update && apt upgrade -y && \
	apt install -y \
	php-fpm \
	php-mysql \
	curl \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]

CMD ["php-fpm8.2", "-F"]