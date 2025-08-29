# Navega al directorio del ejemplo
cd 02_images/02_nginx-static/

# Construye la imagen
docker build -t mi-sitio-nginx .

# Ejecuta el contenedor. Mapea el puerto 80 del contenedor al puerto 80 de tu máquina.
docker run -d -p 80:80 --name mi-sitio-web mi-sitio-nginx

# Verifica que el contenedor se esté ejecutando
docker ps

# Abre tu navegador y navega a http://localhost para ver la página web
# Si usas curl
curl http://localhost

# Detén y elimina el contenedor
docker stop mi-sitio-web
docker rm mi-sitio-web