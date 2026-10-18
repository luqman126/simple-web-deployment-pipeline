from flask import Flask, app, jsonify

myapp  = Flask(__name__)

@myapp.route('/', methods=['GET'])
def welcome():
    return 'Flask Web Service — production-ready service with automated CI/CD pipeline, Docker containerization, and rollback mechanism. Built on AWS EC2 with Nginx reverse proxy and HTTPS. (Luqman, 2026)'

@myapp.route('/health', methods=['GET'])
def health():
    data = {
        "status": "ok"
        }
    return jsonify(data)

if __name__ == '__main__':
    myapp.run(host='0.0.0.0', port=5000, debug=False)