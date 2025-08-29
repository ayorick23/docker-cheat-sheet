# Usa una imagen base ligera de Python
FROM python:3.9-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de requerimientos primero para aprovechar la caché de capas
COPY requirements.txt .

# Instala las dependencias. Usa --no-cache-dir para ahorrar espacio
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos de la aplicación
COPY . .

# Expone el puerto que la aplicación Flask usará
EXPOSE 5000

# Define el comando para ejecutar la aplicación
CMD ["python", "app.py"]