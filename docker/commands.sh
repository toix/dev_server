docker stop nginx
docker rm nginx

docker container rm certbot
docker volume rm ng_srv_web-root

docker exec -it nginx bash

docker login
toix
neldeciL86

docker-compose down
docker-compose logs -f
docker-compose up -d --build