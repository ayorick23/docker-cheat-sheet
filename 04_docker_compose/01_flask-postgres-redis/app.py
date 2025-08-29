import os
from flask import Flask, jsonify
import redis
import psycopg2

app = Flask(__name__)

# Configuración de las conexiones a los servicios
try:
    # Conexión a Redis usando el nombre del servicio 'redis'
    r = redis.Redis(host='redis', port=6379, db=0)
    r.ping()
    app.logger.info("Conexión a Redis exitosa.")
except Exception as e:
    app.logger.error(f"Error conectando a Redis: {e}")

try:
    # Conexión a PostgreSQL usando el nombre del servicio 'db'
    conn = psycopg2.connect(
        host='db',
        database=os.getenv("POSTGRES_DB"),
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD")
    )
    cursor = conn.cursor()
    cursor.execute("SELECT 1")
    app.logger.info("Conexión a PostgreSQL exitosa.")
except Exception as e:
    app.logger.error(f"Error conectando a PostgreSQL: {e}")

@app.route('/')
def status_check():
    response = {
        "status": "ok",
        "services": {}
    }
    
    # Comprobar estado de Redis
    try:
        r.ping()
        response['services']['redis'] = 'Conectado'
    except Exception:
        response['services']['redis'] = 'Desconectado'

    # Comprobar estado de PostgreSQL
    try:
        cursor.execute("SELECT 1")
        response['services']['postgresql'] = 'Conectado'
    except Exception:
        response['services']['postgresql'] = 'Desconectado'
        
    return jsonify(response)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)