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