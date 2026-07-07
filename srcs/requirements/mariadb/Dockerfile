FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf

COPY tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]

CMD ["mysqld"]