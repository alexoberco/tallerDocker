#!/bin/bash
# Crea la red externa y ejecuta cada compose por separado

# Crear la red "network" si no existe
if ! docker network inspect network > /dev/null 2>&1; then
  echo "Creando la red 'network'..."
  docker network create network
fi

echo "Ejecutando docker-compose para la base de datos..."
docker-compose -f docker-compose-db.yml up -d

echo "Ejecutando docker-compose para Adminer..."
docker-compose -f docker-compose-adminer.yml up -d
