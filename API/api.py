from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/api", methods = ['GET'])
def returnascii():
    d = {}
    inputchr = str(request.args['query'])
    try:
        answer = str(ord(inputchr))
        d['output'] = answer
    except:
        d['output'] = "Invalid Input(Note: Type only Character)"
    return d

if __name__ == '__main__':
    app.run(debug = True)