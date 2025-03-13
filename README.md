# 🚀 Docker Multi-Container Project

Este proyecto levanta dos contenedores Docker (PostgreSQL y Adminer) para gestionar una base de datos de ejemplo. Se incluyen opciones para ejecutar el proyecto usando Docker Compose y scripts personalizados, disponibles tanto para entornos Linux/macOS (scripts `.sh`) como para Windows (scripts `.bat`).

[![Docker](https://img.shields.io/badge/Docker-CE-blue?logo=docker&style=flat-square)] [![Compose](https://img.shields.io/badge/Docker%20Compose-v3.1-blue?logo=docker&style=flat-square)]

## 📑 Tabla de Contenidos

- [Visión General](#visión-general)
- [Requisitos](#requisitos)
- [Configuración Inicial](#configuración-inicial)
- [Uso](#uso)
  - [Ejecutar con Scripts Shell (Linux/macOS)](#ejecutar-con-scripts-shell-linuxmacos)
  - [Ejecutar con Scripts Batch (Windows)](#ejecutar-con-scripts-batch-windows)
- [Scripts Disponibles](#scripts-disponibles)
- [Acceso a Adminer](#acceso-a-adminer)


## 🌟 Visión General

Este proyecto utiliza **Docker Compose** para orquestar contenedores. Se ofrecen tres alternativas para levantar los servicios:

1. **Ejecutar dos archivos compose separados** (uno para la base de datos y otro para Adminer).
2. **Ejecutar un único archivo compose** que utiliza `build` para construir imágenes a partir de Dockerfiles.
3. **Construir y correr manualmente** los contenedores a partir de Dockerfiles.

Además, se incluyen scripts tanto para entornos Linux/macOS (`.sh`) como para Windows (`.bat`).

## 🔧 Requisitos

- [Docker Engine ](https://docs.docker.com/engine/) o Docker Desktop instalado.
- Docker Compose (incluido en Docker Desktop o instalado por separado).
- (Opcional) Git Bash, Cygwin o WSL para ejecutar scripts `.sh` en Windows.

## 🛠 Configuración Inicial

Primero, crea una red externa para que los contenedores puedan comunicarse:

```sh
docker network create mynetwork
```

Esta red se usará en cada método de ejecución para conectar la base de datos y Adminer.

## 💻 Uso

### Ejecutar con Scripts Shell (Linux/macOS)

Navega al directorio del proyecto y ejecuta uno de los siguientes scripts:

- **Ejecutar archivos compose separados:**

```sh
./run_separated_compose.sh
```

- **Ejecutar un único archivo compose con Dockerfiles:**

```sh
./run_compose_with_dockerfiles.sh
```

- **Construir y correr manualmente con Dockerfiles:**

```sh
./run_dockerfiles_manually.sh
```


### Ejecutar con Scripts Batch (Windows)

Abre el Command Prompt o PowerShell, navega al directorio del proyecto y ejecuta uno de estos comandos:

- **Ejecutar archivos compose separados:**

```batch
run_separated_compose.bat
```

- **Ejecutar un único archivo compose con Dockerfiles:**

```batch
run_compose_with_dockerfiles.bat
```

- **Construir y correr manualmente con Dockerfiles:**

```batch
run_dockerfiles_manually.bat
```

## 📜 Scripts Disponibles

- **Shell Scripts (Linux/macOS):**
  - `run_separated_compose.sh`: Crea la red y ejecuta dos archivos compose separados (docker-compose-db.yml y docker-compose-adminer.yml).
  - `run_compose_with_dockerfiles.sh`: Crea la red y ejecuta un único docker-compose.yml que utiliza la opción build.
  - `run_dockerfiles_manually.sh`: Crea la red, construye las imágenes desde los Dockerfiles (Dockerfile-db y Dockerfile-adminer) y corre los contenedores con docker run.

- **Batch Scripts (Windows):**
  - `run_separated_compose.bat`: Ejecuta los dos archivos compose por separado.
  - `run_compose_with_dockerfiles.bat`: Ejecuta el archivo compose único que construye las imágenes.
  - `run_dockerfiles_manually.bat`: Construye y ejecuta los contenedores manualmente desde los Dockerfiles.

## 🔑 Acceso a Adminer

Una vez que los contenedores estén en ejecución, abre tu navegador y visita:

```
http://localhost:8080
```

Utiliza las siguientes credenciales para conectarte a PostgreSQL:

- **Servidor:** `db_container` (nombre asignado al contenedor de la base de datos)
- **Usuario:** `admin`
- **Contraseña:** `admin`
- **Base de datos:** `baseTaller`
