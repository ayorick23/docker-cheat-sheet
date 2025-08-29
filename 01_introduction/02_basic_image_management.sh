#!/bin/bash

# Este script demuestra la gestión básica de imágenes y contenedores.

IMAGEN="nginx"
CONTENEDOR_ID=""

echo "--- Paso 1: Descargando la imagen oficial de Nginx ---"
docker pull $IMAGEN
echo -e "\n--- Listando las imágenes locales ---"
docker images

echo -e "\n--- Paso 2: Ejecutando un contenedor de Nginx en segundo plano (-d) ---"
echo "El puerto 80 del contenedor se mapeará al puerto 8080 de tu máquina."
CONTENEDOR_ID=$(docker run -d -p 8080:80 $IMAGEN)
echo "Contenedor iniciado con ID: $CONTENEDOR_ID"
echo -e "\n--- Listando los contenedores en ejecución ---"
docker ps

echo -e "\n--- Paso 3: Deteniendo el contenedor ---"
docker stop $CONTENEDOR_ID
echo -e "\n--- Listando todos los contenedores (ahora estará inactivo) ---"
docker ps -a

echo -e "\n--- Paso 4: Eliminando el contenedor ---"
docker rm $CONTENEDOR_ID
echo -e "\n--- Paso 5: Eliminando la imagen de Nginx ---"
# Es necesario detener y eliminar el contenedor antes de poder eliminar la imagen
docker rmi $IMAGEN
echo -e "\n--- Listando las imágenes locales para verificar su eliminación ---"
docker images