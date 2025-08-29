# Usa la imagen oficial de Nginx como base
FROM nginx:alpine

# Copia tu archivo index.html al directorio por defecto de Nginx
# La ruta por defecto de Nginx para el contenido estático es /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/index.html

# El puerto 80 ya está expuesto por la imagen base de Nginx, no es necesario re-exponerlo.