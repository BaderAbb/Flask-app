from flask import Flask
import socket

example = Flask(__name__)

@example.route('/')
def hello_world():
    return 'ID del contenedor: ' + socket.gethostname() + '\n'

if __name__ == '__main__':
    example.run(debug=False, host='0.0.0.0', port=5000)
