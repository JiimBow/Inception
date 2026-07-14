* This project has been created as part of 42 curriculum by jodone *

# Inception

## Description :
This project consists of having set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. We have to use ```docker compose```. We have to set up 3 Docker container that contains **NGINX**, **WordPress** and **MariaDB**. One volume for WordPress database and one that contains WordPress website files.
A **docker network** must establishes the connection between the containers.


## Instructions :
First launch the VM and ```git pull``` the project. The is a .env.exemple file that you need to rename .env and to complete him by enter domain's name (<login>.42.fr), and passwords require for root, user and admin account.
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

## VM vs Docker

A virtual machine emulates an entire operating system. The kernel is independant and you have strong isolation, but uses higher resource and larger disk usage. Containers share the host kernel  while isolating processes and filesystems. it has fast startup, lower resource consumption and it's lightweight. But isolation is weaker.


## Secret vs Environment variables

Env provide configuration values to containers at runtime. It is simple to configure and easy to integrate with Docker Compose. But values may be visible through container inspoection and there is risk of accidental password exposure if commited on git repo.

Docker secert store sensitive information separately from application configuration. So it's a better protection of sensitive data, but it's more complex to configure and more designed for Docker Swarm environements.


## Docker network vs Host network

In host network, containers share the host network stack directly. There can be risk of port conflicts and but better perfomance. In bridge network, containers are isolated and can't communicate with the host, without port configuration.


## Docker volumes vs Bind mounts

A bind mount directly maps a host directory into a container. It's an easy access from the host system, bu depend on host filesystem structure and is more sensitive to permission issues. Docker volume are managed directly by Docker, has better portability and easier backup and management. It's independant from host directory layout but is less directly visible from the host.

