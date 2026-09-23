#! /bin/bash

docker load -i vollmed-api.tar

mv docker-compose-prod.yaml docker-compose.yaml

container-ids=$(docker ps -q)

if [ -z "$container_ids" ]; then
  echo "Nao ha container em execucao"
else 
  for container_id in $container_ids; do
    echo "Parando container: $container_id"
    docker stop $container_id
  done
  echo "Todos os container em execucao foram parados."
fi

docker compose up -d
