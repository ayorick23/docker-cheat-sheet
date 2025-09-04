import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from joblib import dump

# 1. Generar datos de ejemplo
# En un proyecto real, cargarías tus datos desde un archivo (ej. .csv)
data = {'feature_1': [1, 2, 3, 4, 5],
        'feature_2': [2, 4, 6, 8, 10],
        'target': [3, 6, 9, 12, 15]}

df = pd.DataFrame(data)

# 2. Dividir los datos en características (X) y objetivo (y)
X = df[['feature_1', 'feature_2']]
y = df['target']

# 3. Entrenar un modelo simple de regresión lineal
model = LinearRegression()
model.fit(X, y)

# 4. Guardar el modelo entrenado en un archivo .pkl
# La biblioteca 'joblib' es ideal para serializar modelos de scikit-learn
dump(model, 'model.pkl')

print("Modelo de regresión lineal entrenado y guardado en 'model.pkl' exitosamente.")