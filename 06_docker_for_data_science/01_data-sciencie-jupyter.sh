#!/bin/bash

# Este script automatiza la construcción y ejecución de un entorno de Jupyter en Docker.

# Define el nombre de la imagen y del contenedor
IMAGE_NAME="ds-jupyter-env"
CONTAINER_NAME="jupyter-container"

echo "--- Paso 1: Construyendo la imagen de Docker para el entorno de Ciencia de Datos ---"
docker build -t $IMAGE_NAME .

echo -e "\n--- Paso 2: Ejecutando el contenedor de Jupyter ---"
echo "El contenedor montará el directorio actual en /app."
docker run -it -p 8888:8888 -v $(pwd):/app --name $CONTAINER_NAME $IMAGE_NAME

echo -e "\n--- Paso 3: Para detener y eliminar el contenedor, ejecuta los siguientes comandos en otra terminal: ---"
echo "docker stop $CONTAINER_NAME"
echo "docker rm $CONTAINER_NAME"