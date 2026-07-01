#!/bin/bash

set -e

echo "Starting WordPress setup..."

until mysql -h mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -e "SELECT 1;" > /dev/null 2>&1
do
	echo "Waiting for MariaDB..."
	sleep 1
done

echo "MariaDB is ready!"

echo "Installing WordPress..."

mkdir -p /var/www/html

cd /var/www/html

if [ ! -f wp-load.php ]; then
	curl -O https://wordpress.org/wordpress-6.8.2.tar.gz
	tar -xzf wordpress-6.8.2.tar.gz --strip-components=1
	rm -f wordpress-6.8.2.tar.gz
fi

echo "WordPress downloaded."

echo "Creating wp-config.php..."

cd /var/www/html

if [ ! -f wp-config.php ]; then
	wp config create \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost="mariadb" \
		--path="/var/www/html" \
		--allow-root
	echo "wp-config.php created."
fi

echo "Installing WordPress site..."

cd /var/www/html

if ! wp core is-installed --allow-root; then
	wp core install \
	--url="https://$DOMAIN_NAME" \
	--title="Inception" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--skip-email \
	--allow-root

	echo "WordPress installed."
fi

echo "Starting PHP-FPM..."

exec php-fpm -F