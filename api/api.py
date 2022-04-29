from flask import Flask, jsonify, abort, make_response, request, Response
import json

api = Flask(__name__)
log = 'resource.log'

@api.route('/log/<text>', methods=['GET'])
def get_value(text):
    results = []
    with open('resource.log') as f:
        logfile = f.readlines()
    count = 0
    for line in logfile:
        if text in line:
            count += 1
            record['key'] = count
            record['value'] = line
            results.append(record)
    resultsJson = json.dumps(results)
    return jsonify({'results': resultsJson})
    
@api.route('/')
def index():
    return "Welcome to my sandbox"

@api.errorhandler(404)
def not_foubnd(error):
    return make_response(jsonify({"Error": "Resource not found"}),404)
    
if __name__ == '__main__':
    api.run(host='0.0.0.0', port=8080)