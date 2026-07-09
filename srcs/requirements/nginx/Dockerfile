FROM debian:bookworm

RUN apt update -y && apt upgrade -y && \
	apt install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=Inception/CN=${DOMAIN_NAME}"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN	chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]