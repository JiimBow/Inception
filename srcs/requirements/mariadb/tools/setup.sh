#!/bin/bash

echo "Initializing MariaDB..."

# Create folder if needed
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# Run MariaDB temporarely
mysqld_safe --datadir=/var/lib/mysql &

echo "Waiting for MariaDB..."

until mysqladmin ping --silent; do
    sleep 1
done

echo "MariaDB is ready."

# Configure database and users
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOF

echo "Database configured."

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

echo "Starting MariaDB..."

exec mysqld_safe