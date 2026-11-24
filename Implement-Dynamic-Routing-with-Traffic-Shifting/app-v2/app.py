from flask import Flask, jsonify
import os
import socket
from datetime import datetime

app = Flask(__name__)

@app.route('/api/version')
def get_version():
    return jsonify({
        'version': '2.0.0',
        'message': 'Hello from Version 2 - Now with Enhanced Features!',
        'hostname': socket.gethostname(),
        'features': ['basic-functionality', 'core-api', 'enhanced-analytics', 'real-time-updates']
    })

@app.route('/api/health')
def health_check():
    return jsonify({'status': 'healthy', 'version': '2.0.0'})

@app.route('/api/data')
def get_data():
    return jsonify({
        'data': 'This is enhanced data from version 2',
        'timestamp': datetime.now().isoformat(),
        'version': '2.0.0',
        'enhanced': True
    })

@app.route('/api/analytics')
def get_analytics():
    return jsonify({
        'analytics': 'Advanced analytics data',
        'metrics': {'requests': 100, 'response_time': '50ms'},
        'version': '2.0.0'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
