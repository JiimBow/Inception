#!/bin/bash

echo "Initializing MariaDB..."

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXIST \`${MYSQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

echo "Database configured."

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

echo "Starting MariaDB..."

exec mysqld_safe