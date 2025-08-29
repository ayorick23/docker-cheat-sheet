#!/bin/bash

# Este script demuestra cómo ejecutar un contenedor simple.
echo "--- Ejecutando el contenedor 'hello-world' ---"
echo "Este comando descargará la imagen 'hello-world' de Docker Hub (si no la tienes) y la ejecutará."
docker run hello-world

echo -e "\n--- Listando todos los contenedores (activos e inactivos) ---"
echo "El contenedor 'hello-world' ya ha finalizado su ejecución."
docker ps -a