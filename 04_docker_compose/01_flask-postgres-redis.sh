# Navega al directorio del ejemplo
cd 01_docker_compose/01_flask-postgres-redis/

# Inicia la aplicación. El comando 'up' construirá la imagen y levantará todos los servicios
docker compose up -d

# Verifica el estado de los servicios. Deberían estar 'Up' (en ejecución)
docker compose ps

# Revisa los logs de la aplicación web
docker compose logs web

# (Opcional) Abre tu navegador y visita http://localhost:8000 para ver el estado de la aplicación
# Si usas curl
curl http://localhost:8000

# Detén y elimina todos los servicios y la red
docker compose down

# (Opcional) Si quieres eliminar también el volumen de datos (ten cuidado con esto)
docker compose down --volumes