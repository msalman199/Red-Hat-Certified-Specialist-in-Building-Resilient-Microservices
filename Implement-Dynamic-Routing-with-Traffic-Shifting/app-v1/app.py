from flask import Flask, jsonify
import os
import socket

app = Flask(__name__)

@app.route('/api/version')
def get_version():
    return jsonify({
        'version': '1.0.0',
        'message': 'Hello from Version 1!',
        'hostname': socket.gethostname(),
        'features': ['basic-functionality', 'core-api']
    })

@app.route('/api/health')
def health_check():
    return jsonify({'status': 'healthy', 'version': '1.0.0'})

@app.route('/api/data')
def get_data():
    return jsonify({
        'data': 'This is data from version 1',
        'timestamp': '2024-01-01T00:00:00Z',
        'version': '1.0.0'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
