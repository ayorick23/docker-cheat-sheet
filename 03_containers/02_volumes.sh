#!/bin/bash

# Define el nombre del volumen y del contenedor
VOLUME_NAME="mi-db-datos"
CONTAINER_NAME="mi-mysql-db"

echo "--- Paso 1: Creando un volumen para los datos de la base de datos ---"
docker volume create $VOLUME_NAME

echo -e "\n--- Paso 2: Ejecutando el contenedor de MySQL con el volumen adjunto ---"
# Usamos el flag -v para adjuntar el volumen
# El usuario root no tiene contraseña (-e MYSQL_ALLOW_EMPTY_PASSWORD=yes)
# Los datos de la DB se guardarán en el volumen 'mi-db-datos'
docker run -d --name $CONTAINER_NAME \
  -e MYSQL_ROOT_PASSWORD="" \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  -v $VOLUME_NAME:/var/lib/mysql \
  mysql:5.7

echo -e "\nContenedor '$CONTAINER_NAME' en ejecución. Espera unos segundos para que se inicialice..."
sleep 20

echo -e "\n--- Paso 3: Deteniendo y eliminando el contenedor ---"
# Simula que el contenedor falla o se elimina.
# Los datos persisten en el volumen.
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo -e "\n--- Paso 4: Verificando que el volumen de datos sigue existiendo ---"
docker volume ls

echo -e "\n--- Paso 5: Reiniciando un NUEVO contenedor con el mismo volumen ---"
# Un nuevo contenedor se arranca usando el volumen existente
docker run -d --name $CONTAINER_NAME \
  -e MYSQL_ROOT_PASSWORD="" \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  -v $VOLUME_NAME:/var/lib/mysql \
  mysql:5.7

echo -e "\nContenedor recreado. Los datos que existían antes de la eliminación del contenedor siguen intactos."
echo -e "\n¡Script de persistencia de datos con volúmenes completado!"