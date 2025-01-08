from flask import Flask

# Create a Flask app instance
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/dynia')
def dynia():
    return '<h3>dynia7</h3>'

@app.route('/jabko')
def jabko():
    return '<i>jabko</i>'

@app.route('/test')
def test():
    return 'Test aplikacji devops jesli sie pojawilo przy pullu z dockera znaczy ze jest gwarantowana 4 :)'

@app.route('/test2')
def test2():
    return "blablabla2222"

@app.route('/test3')
def test2():
    return "blablabla2222"

# Run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)