# Inception : Developer Documentation

This project deploys a complete WordPress infrastructure using Docker containers.

The stack provides the following services:
	- NGINX: HTTPS web server and entry point of the infrastructure.
	- WordPress + PHP-FPM: website application.
	- MariaDB: database used by WordPress.

The services communicate through a private Docker network.

Persistent data is stored using Docker volumes:
	- WordPress files
	- MariaDB database

The infrastructure is orchestrated using Docker Compose and managed through a Makefile.


## Project structure

.
|-- Makefile
|-- USER_DOC.md
|-- DEV_DOC.md
|-- README.md
|-- srcs
	|-- .env
	|-- docker-compose.yml
	|-- requirements
		|-- mariadb
		|	|-- Dockerfile
		|	|-- conf
		|	|	|-- 50-server.cnf
		|	|-- tools
		|	|	|-- setup.sh
		|-- wordpress
		|	|-- Dockerfile
		|	|-- tools
		|	|	|-- setup.sh
		|-- nginx
		|	|-- Dockerfile
		|	|-- conf
		|	|	|-- nginx.conf


## Environment setup

The following software must be installed:
	- Docker
	- Docker Compose (or Docker Compose plugin)
	- GNU Make

Verify the installation:
```docker --version```
```docker compose version```
```make --version``


## Domain configuration

The project uses the following domain:
**<login>.42.fr

The domain must resolve to the local machine.

Update /etc/hosts:

```127.0.0.1 <login>.42.fr```


## Environment variables

Create the file:
**srcs/.env**

Example configuration:

```
MYSQL_ROOT_PASSWORD=<your_root_password>
MYSQL_DATABASE=wordpress
MYSQL_USER=<wpuser>
MYSQL_PASSWORD=<your_password>

DOMAIN_NAME=<login>.42.fr
WP_ADMIN_USER=<adminuser> (That can't containt "admin/Admin" or "administrator/Administrator")
WP_ADMIN_PASSWORD=<your_admin_password>
WP_ADMIN_EMAIL=admin@42.fr
```

Real password must not be committed on the git repository.


## Building and launching

From the project root: (on root user or with ```sudo```)

```make```
This build all Docker images, creates the Docker network, creates the required volumes and start all the containers.

Start existing containers:
```make up```

Stop containers:
```make down```

Remove containers and volumes:
```make clean```

Remove all above + build cache, images and networks:
```make fclean```


## Container management

(on root user or with ```sudo```)

List running containers:
```docker ps```

Display container logs:
	- NGINX : ```docker logs nginx```
	- WordPress : ```docker logs wordpress```
	- MariaDB : ```docker logs mariadb```

Access a container shell:
	- NGINX : ```docker exec -it nginx bash```
	- WordPress : ```docker exec -it wordpress bash```
	- MariaDB : ```docker exec -it mariadb bash```

exemple : create a table in mariadb and put some data
```
docker exec -it mariadb bash
mariadb -u root -p
SHOW DATABASES;
USE wordpress;
CREATE TABLE <name> ( id INT);
SHOW TABLES;
INSERT INTO <name> VALUES (42);
SELECT * FROM <name>;
```

## Volume management

(on root user or with ```sudo```)

List volumes:
```docker volume ls```

Inspect a volume:
```docker volume inspect <volume_name>```


## Data persistence

The project uses two persistent Docker volumes.

**MariaDB volume**
	- Database files
	- Tables
	- Users
	- WordPress content stored in the database

Mounted to **/var/lib/mysql**

**WordPress volume**
	- WordPress installation files
	- Themes
	- Plugins
	- Uploaded media

Mounted to **/var/www/html**


## Persistence verification

Create content from wordpress
Stop the infrastucture with ```make down```, then restart it with ```make```

If the content remains available, the Docker volumes are functioning correctly.

The projec data are stored in **/home/<login>/data/mariadb** and **/home/<login>/data/wordpress**, that are clean only when you ```make fclean```