#!/bin/bash
# Crea la red externa y ejecuta docker-compose que construye las imágenes usando los Dockerfiles

# Crear la red "network" si no existe
if ! docker network inspect network > /dev/null 2>&1; then
  echo "Creando la red 'network'..."
  docker network create network
fi

echo "Ejecutando docker-compose con el archivo docker-compose.yml..."
docker-compose -f docker-compose.yml up -d
