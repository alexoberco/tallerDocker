@echo off
REM run_separated_compose.bat: Ejecuta dos archivos docker-compose separados

REM Verifica si la red "network" existe. Si no, la crea.
docker network inspect network >nul 2>&1
if errorlevel 1 (
    echo Creando la red "network"...
    docker network create network
)


echo Ejecutando docker-compose para la base de datos...
docker-compose -f docker-compose-db.yml up -d

echo Ejecutando docker-compose para Adminer...
docker-compose -f docker-compose-adminer.yml up -d

pause
