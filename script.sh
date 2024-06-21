#!/bin/bash

echo "Criando as imagens..."

docker build -t carloshenrryque/projeto-backend:1.0 backend/ .
docker build -t carloshenrryque/projeto-database:1.0 database/ .

echo "Realizando push das imagens..."

docker push carloshenrryque/projeto-backend:1.0
docker push carloshenrryque/projeto-database:1.0

echo "Criando servicos no cluster kubernetes..."

kubeclt apply -f ./services.yml

echo "Criando os deployments..."

kubeclt apply -f ./deployments.yml