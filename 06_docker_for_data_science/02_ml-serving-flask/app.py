import os
import joblib
from flask import Flask, request, jsonify

app = Flask(__name__)

# Cargar el modelo pre-entrenado
try:
    model = joblib.load('model.pkl')
    print("Modelo cargado exitosamente.")
except Exception as e:
    print(f"Error cargando el modelo: {e}")
    model = None

@app.route('/predict', methods=['POST'])
def predict():
    """
    Endpoint para hacer predicciones.
    Espera un JSON con un array de características.
    Ejemplo: {"features": [5.1, 3.5, 1.4, 0.2]}
    """
    if not model:
        return jsonify({'error': 'Modelo no disponible'}), 500

    try:
        data = request.get_json(force=True)
        features = data['features']
        # Realizar la predicción
        prediction = model.predict([features]).tolist()
        return jsonify({'prediction': prediction})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)