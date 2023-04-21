from flask import Flask, jsonify, g, render_template
from flask_cors import CORS
import sqlite3
import threading
import requests

app = Flask(__name__)
CORS(app)

# Set up SQLite database connection
DATABASE = 'heart_indicators.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

# Defining Flask routes
@app.route('/')
def index():
    # Fetch data from API endpoint
    data = requests.get('http://localhost:5000/data').json()

    # Render template with data
    return render_template('dashboard.html', data=data)

@app.route('/data')
def data():
    # Query database and return results as JSON
    db = get_db()
    c = db.cursor()
    c.execute('SELECT * FROM heart_indicators')
    results = c.fetchall()
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True)
