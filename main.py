from flask import Flask
import os
import tensorflow as tf
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Docker from Pycharm!"

if __name__ == "__main__":
    print(os.environ.get('CONDA_DEFAULT_ENV'))
    app.run(host="0.0.0.0", port=5000)