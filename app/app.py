from flask import Flask

# Create a Flask app instance
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def hello_world():
    return 'azerbejdzan'

@app.route('/dynia')
def dynia():
    return '<h3>dynia7</h3.'

@app.route('jabko')
def jabko():
    return '<i>jabko</i>'

# Run the app
if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=80)