FROM debian:bookworm

RUN apt update && apt upgrade -y && \
	apt install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=NA/L=Angouleme/O=42/OU=Inception/CN=${DOMAIN_NAME}"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "deamon off;"]