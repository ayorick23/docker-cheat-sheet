# Usamos una imagen base de Python
FROM python:3.9-slim

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos los requisitos y el modelo
COPY requirements.txt .
COPY model.pkl .

# Instalamos las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto de la aplicación
COPY app.py .

# Exponemos el puerto de la API
EXPOSE 5000

# Comando para iniciar el servicio Flask
CMD ["python", "app.py"]