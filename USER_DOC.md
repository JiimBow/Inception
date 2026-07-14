# Inception : User Documentation

This project deploys a complete WordPress infrastructure using Docker containers.

The stack provides the following services:
	- NGINX: HTTPS web server and entry point of the infrastructure.
	- WordPress + PHP-FPM: website application.
	- MariaDB: database used by WordPress.

The services communicate through a private Docker network.

Persistent data is stored using Docker volumes:
	- WordPress files
	- MariaDB database


## Start the project

From the root of this project:
```make```
This command build all Docker images and start the infrastructure.

To verify that the containers are running:
```docker ps```


## Stop the project

To stop the containers:
```make down```

To stop the containers and remove volumes:
```make clean```

To completely remove containers, images, cache and volumes:
```make fclean```


## Accessing the Website

Open a web browser and go to:
**https://<login>.42.fr**

The browser may display a warning because the project uses a self-signed SSL certificate. Accept the warning to continue.


## Credential management

Credentials are stored in:
**srcs/ .env**

This file contains:
	- MariaDB root password
	- MariaDB user credentials
	- WordPress administrator credentials
	- Domain configuration

Example variables:

```
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=

DOMAIN_NAME=
WP_ADMIN_USER=
WP_ADMIN_PASSWORD=
WP_ADMIN_EMAIL=
```

No passwords are committed on the Git repository.


## Checking service health

Check running containers:
```docker ps```
All containers should have the status: **up**

Check logs:
	- NGINX : ```docker logs nginx```
	- WordPress : ```docker logs wordpress```
	- MariaDB : ```docker logs mariadb```

Check network:
```docker network ls```
```docker network inspect inception```

## Verify database persistence

Create content from the WordPress page (post a comment, etc...)
Approuve with admin, on **https://<login>.42.fr/wp-admin**. Log with admin name and password.

Stop the stack:
```make down```
And restart it:
```make```

Verify that the added content is still present.