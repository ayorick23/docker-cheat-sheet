# Usamos una imagen base ligera de Python
FROM python:3.9-slim

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos solo los requisitos para aprovechar la caché de Docker
COPY requirements.txt .

# Instalamos las bibliotecas necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del proyecto al contenedor
COPY . .

# Exponemos el puerto por defecto de Jupyter Notebook
EXPOSE 8888

# Comando para iniciar Jupyter Notebook
# El argumento --allow-root es necesario para ejecutar como usuario root en el contenedor
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]