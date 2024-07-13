from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def get_hostname():
    return f"Hostname: {socket.gethostname()}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

