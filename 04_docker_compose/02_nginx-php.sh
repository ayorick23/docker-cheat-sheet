# Navega al directorio del ejemplo
cd 04_docker_compose/02_nginx-php/

# Inicia los servicios
docker compose up -d

# Verifica que los contenedores estén en ejecución
docker compose ps

# Visita http://localhost para ver la página de PHP
# Si usas curl
curl http://localhost

# Detén y elimina los servicios
docker compose down