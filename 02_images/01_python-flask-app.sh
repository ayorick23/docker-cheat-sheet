# Navega al directorio del ejemplo
cd 02_images/01_python-flask-app/

# Construye la imagen. Asigna un tag con tu nombre de usuario de Docker Hub
# (esto es importante para el ejemplo de push)
docker build -t <tu_usuario>/mi-flask-app:1.0 .

# Lista las imágenes para ver la que acabas de crear
docker images

# Ejecuta un contenedor a partir de la imagen que creaste
# Mapea el puerto 5000 del contenedor al puerto 8000 de tu máquina
docker run -d -p 8000:5000 --name flask-app-container <tu_usuario>/mi-flask-app:1.0

# Verifica que el contenedor se esté ejecutando
docker ps

# Abre tu navegador y navega a http://localhost:8000 para ver la aplicación
# Si usas curl en la terminal
curl http://localhost:8000

# Detén y elimina el contenedor
docker stop flask-app-container
docker rm flask-app-container

# (Opcional) Publica la imagen en Docker Hub
# Primero inicia sesión
docker login
# Luego sube la imagen
docker push <tu_usuario>/mi-flask-app:1.0