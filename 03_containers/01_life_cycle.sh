#!/bin/bash

# Define el nombre del contenedor para facilitar la gestión
CONTAINER_NAME="mi-nginx-prueba"

echo "--- Paso 1: Ejecutando un contenedor de Nginx en segundo plano ---"
# El comando `run` crea y arranca el contenedor en un solo paso
docker run -d --name $CONTAINER_NAME -p 8080:80 nginx:latest

echo -e "\n--- Listando contenedores en ejecución ---"
docker ps

# Espera unos segundos para que puedas verificar que el contenedor está activo
echo -e "\nContenedor '$CONTAINER_NAME' en ejecución en http://localhost:8080. Presiona Enter para continuar..."
read

echo "--- Paso 2: Deteniendo el contenedor ---"
# El comando `stop` envía una señal de apagado ordenada al contenedor
docker stop $CONTAINER_NAME

echo -e "\n--- Listando todos los contenedores (activos e inactivos) ---"
# Ahora el contenedor debería aparecer como 'Exited' (detenido)
docker ps -a

echo -e "\n--- Paso 3: Reiniciando el contenedor ---"
# El comando `start` vuelve a arrancar un contenedor detenido
docker start $CONTAINER_NAME

echo -e "\n--- Verificando que el contenedor está en ejecución nuevamente ---"
docker ps

echo -e "\n--- Paso 4: Deteniendo y eliminando el contenedor ---"
# Para eliminar un contenedor, primero debe estar detenido
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo -e "\n--- Verificando que el contenedor ya no existe ---"
# La lista debería estar vacía o no contener el contenedor que eliminamos
docker ps -a

echo -e "\n¡Script de demostración del ciclo de vida de un contenedor completado!"