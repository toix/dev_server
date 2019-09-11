docker stop nginx
docker rm nginx

docker container rm certbot
docker volume rm ng_srv_web-root

docker-compose down
docker-compose up -d --build
