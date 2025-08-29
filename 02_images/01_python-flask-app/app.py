from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return f"¡Hola desde el contenedor Docker! \nEsta es una aplicación de prueba."

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)