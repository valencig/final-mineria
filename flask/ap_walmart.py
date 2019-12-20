import pickle
import numpy as np
from flask import Flask, jsonify, request

app = Flask(__walmart__)

## Carga del documento picke
with open("model_walmart.pkl", "rb") as f:
     model = pickle.load(f)
     

# Métodp utilizado y predicciones     
@app.route('/modelo', methods=['POST']) 
def modelo(): 
    json = request.get_json()
    data = request.form if json is None else json
    x = data['diabetes_x']
	
    inp = np.zeros((1,1))
    inp[0,0]=x

    results = {}
    results['walmart_x'] = x
    y = model.predict(inp)
    results['walmart_y'] = y[0]	
    return jsonify(results)

# Ruta 
@app.route('/')
def api_root():
    return 'Servicio modelo vivo'

if __name__ == '__main__':
    app.run(host= '0.0.0.0')