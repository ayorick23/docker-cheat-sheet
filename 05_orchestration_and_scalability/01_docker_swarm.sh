#!/bin/bash

# Define el nombre del servicio
SERVICE_NAME="web-service"
# Define el número inicial de réplicas
INITIAL_REPLICAS=3

echo "--- Paso 1: Inicializando el clúster Docker Swarm ---"
# Se inicializa el Swarm en la máquina actual.
# --advertise-addr es necesario para que el manager se anuncie a otros nodos.
docker swarm init --advertise-addr 127.0.0.1

echo -e "\n--- Paso 2: Desplegando el servicio '$SERVICE_NAME' con $INITIAL_REPLICAS réplicas ---"
# `docker service create` crea un servicio que Swarm orquestará.
# --replicas: el número deseado de contenedores.
# --name: el nombre del servicio.
# -p: mapeo de puertos. El balanceo de carga está integrado.
docker service create --name $SERVICE_NAME --replicas $INITIAL_REPLICAS -p 8080:80 nginx:alpine

echo -e "\nEsperando 10 segundos para que los servicios se desplieguen..."
sleep 10

echo -e "\n--- Paso 3: Verificando el estado del servicio ---"
# `docker service ls` muestra los servicios orquestados por Swarm.
docker service ls
# `docker ps` en el manager muestra los contenedores de las réplicas en ejecución.
docker ps

echo -e "\nEl servicio está disponible en http://localhost:8080. Puedes ver las 3 réplicas en ejecución."
echo "Presiona Enter para continuar y escalar el servicio..."
read

echo -e "\n--- Paso 4: Escalando el servicio a 5 réplicas ---"
# `docker service scale` es el comando clave para la escalabilidad.
docker service scale $SERVICE_NAME=5

echo -e "\nEsperando 10 segundos para que los nuevos contenedores se inicien..."
sleep 10

echo -e "\n--- Paso 5: Verificando el nuevo estado del servicio ---"
# Ahora deberías ver 5 réplicas de Nginx en ejecución.
docker service ls
docker ps

echo -e "\n--- Paso 6: Limpiando el clúster ---"
echo "Deteniendo y eliminando el servicio..."
docker service rm $SERVICE_NAME

echo -e "\nSaliendo del clúster Swarm..."
# Para limpiar el nodo, debe salir del Swarm.
docker swarm leave --force

echo -e "\n¡El script ha finalizado! Docker Swarm ha sido desactivado."