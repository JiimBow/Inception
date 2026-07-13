* This project has been created as part of 42 curriculum by jodone *

# Inception

## Description :
This project consists of having set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. We have to use ```docker compose```. We have to set up 3 Docker container that contains **NGINX**, **WordPress** and **MariaDB**. One volume for WordPress database and one that contains WordPress website files.
A **docker network** must establishes the connection between the containers.


## Instructions :
First launch the VM and ```git pull``` the project. The is a .env.exemple file that you need to rename .env and to complete him by enter domain's name (login.42.fr), and passwords require for root, user and admin account.
Then you can ```make``` in root or with ```sudo```.
Open your web browser and go to login.42.fr. Check the TLS protection and voila ! You have your wordpress page.
If you want to turn down the container, use ```make down```.
If you want to clean all file and delete volumes, use ```make fclean```.


## Resources :
https://tuto.grademe.fr/inception/
This site help me a lot to understand what a container is, and follow step by step was really usefull !

https://blog.stephane-robert.info/docs/conteneurisation/
https://github.com/stephrobert/containers-training/blob/main/README.md
This two made by Stephane Robert was a training to check my knowledge about the subject.

AI was used to understand some error and bash command.

//lancer mariadb et s'y connecter
docker exec -it mariadb bash
mariadb -u root -p
SHOW DATABASES;

//commande docker a utiliser avec sudo ou en root
docker compose up -d
docker compose down (-v pour supprimer les volumes)
docker ps -a (voir conteneurs)
docker images (voir images)
docker volume ls (voir volume)