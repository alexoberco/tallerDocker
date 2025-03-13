@echo off
REM run_compose_with_dockerfiles.bat: Ejecuta un único docker-compose que usa la directiva build

REM Verifica si la red "network" existe. Si no, la crea.
docker network inspect network >nul 2>&1
if errorlevel 1 (
    echo Creando la red "network"...
    docker network create network
)

echo Ejecutando docker-compose con docker-compose.yml...
docker-compose -f docker-compose.yml up -d

pause
