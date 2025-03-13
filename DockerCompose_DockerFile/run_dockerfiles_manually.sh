#!/bin/bash
# Crea la red externa, construye las imágenes desde los Dockerfiles y ejecuta los contenedores manualmente

# Crear la red "network" si no existe
if ! docker network inspect network > /dev/null 2>&1; then
  echo "Creando la red 'network'..."
  docker network create network
fi

echo "Construyendo la imagen para la base de datos..."
docker build -t mydb -f Dockerfile-db .

echo "Construyendo la imagen para Adminer..."
docker build -t myadminer -f Dockerfile-adminer .

echo "Ejecutando el contenedor de la base de datos..."
docker run -d --name db_container --network network -v pgdata:/var/lib/postgresql/data mydb

echo "Ejecutando el contenedor de Adminer..."
docker run -d --name adminer_container --network network -p 8080:8080 myadminer
