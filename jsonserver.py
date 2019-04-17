from flask import Flask, jsonify, request
import json
app = Flask(__name__)

@app.route("/", methods=['GET'])
def hello():
    result = {"result": "hello"}
    return jsonify(result)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)
