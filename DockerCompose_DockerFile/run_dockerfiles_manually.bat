@echo off
REM run_dockerfiles_manually.bat: Construye las imágenes a partir de Dockerfiles y levanta los contenedores manualmente

REM Verifica si la red "network" existe. Si no, la crea.
docker network inspect network >nul 2>&1
if errorlevel 1 (
    echo Creando la red "network"...
    docker network create network
)

echo Construyendo la imagen para la base de datos...
docker build -t mydb -f Dockerfile-db .

echo Construyendo la imagen para Adminer...
docker build -t myadminer -f Dockerfile-adminer .

echo Ejecutando el contenedor de la base de datos...
docker run -d --name db_container --network network -v pgdata:/var/lib/postgresql/data mydb

echo Ejecutando el contenedor de Adminer...
docker run -d --name adminer_container --network network -p 8080:8080 myadminer

pause
