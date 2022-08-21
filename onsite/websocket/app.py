from flask import Flask
from flask_socketio import SocketIO

async_mode = None
app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socket_ = SocketIO(app, async_mode=async_mode)
@app.route('/')
def index():
    return "This is Akshat's socket server"

@socket_.on('message')
def handle_message(data):
    print('received message: ' + data)


if __name__ == '__main__':
    socket_.run(app, debug=True)