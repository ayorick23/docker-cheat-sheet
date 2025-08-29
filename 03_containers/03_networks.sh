#!/bin/bash

# Define los nombres de la red y los contenedores
NETWORK_NAME="mi-red-app"
DB_CONTAINER_NAME="mi-base-de-datos"
WEB_CONTAINER_NAME="mi-app-web"

echo "--- Paso 1: Creando una red personalizada tipo 'bridge' ---"
docker network create --driver bridge $NETWORK_NAME

echo -e "\n--- Paso 2: Ejecutando el contenedor de la base de datos en la red personalizada ---"
# La DB no expone ningún puerto al exterior, solo a la red interna
docker run -d --network $NETWORK_NAME --name $DB_CONTAINER_NAME \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=app_db \
  mysql:5.7

echo -e "\n--- Paso 3: Ejecutando el contenedor de la aplicación web en la misma red ---"
# Este contenedor puede conectarse a la DB usando su nombre 'mi-base-de-datos'
# Este ejemplo usa una imagen de un servidor web sencillo
docker run -d --network $NETWORK_NAME --name $WEB_CONTAINER_NAME \
  -p 8080:80 \
  nginx

echo -e "\nContenedores en ejecución en la red '$NETWORK_NAME':"
docker ps

echo -e "\n--- Paso 4: Inspeccionando la red ---"
# Muestra los contenedores que están conectados a la red
docker network inspect $NETWORK_NAME

echo -e "\n--- Paso 5: Limpiando los contenedores y la red ---"
# Detener y eliminar los contenedores
docker stop $WEB_CONTAINER_NAME $DB_CONTAINER_NAME
docker rm $WEB_CONTAINER_NAME $DB_CONTAINER_NAME

# Eliminar la red
docker network rm $NETWORK_NAME

echo -e "\n¡Script de redes de contenedores completado!"