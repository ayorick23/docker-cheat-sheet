#!/bin/bash

# Este script automatiza la construcción y el despliegue de una API de ML con Flask en Docker.

# Define el nombre de la imagen y del contenedor
IMAGE_NAME="ml-api"
CONTAINER_NAME="ml-api-container"

echo "--- Paso 1: Construyendo la imagen de Docker para el servicio de API de ML ---"
docker build -t $IMAGE_NAME .

echo -e "\n--- Paso 2: Ejecutando el contenedor de la API en segundo plano ---"
docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME

echo -e "\n--- Paso 3: Espera 5 segundos para que la API se inicie... ---"
sleep 5

echo "--- Paso 4: Probando el endpoint de predicción con curl ---"
echo "Enviando una solicitud POST con datos de ejemplo..."
curl -X POST http://localhost:5000/predict \
     -H "Content-Type: application/json" \
     -d "{\"features\": [5.1, 3.5, 1.4, 0.2]}"

echo -e "\n\n--- Paso 5: Limpiando el entorno ---"
echo "Deteniendo y eliminando el contenedor..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo -e "\nScript completado. El contenedor ha sido detenido y eliminado."