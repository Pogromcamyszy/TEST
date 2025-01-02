from flask import Flask

# Create a Flask app instance
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/dynia4')
def dynia():
    return '<h3>dynia4</h3.'

# Run the app
if __name__ == '__main__':
    app.run(debug=True)