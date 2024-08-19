from flask import Flask, jsonify

app = Flask(__name__)

# Enable pretty-printing of JSON responses globally
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True

# List of inspirational quotes
quotes = [
    "The best way to predict the future is to invent it. - Alan Kay",
    "Life is 10% what happens to us and 90% how we react to it. - Charles R. Swindoll",
    "The only way to do great work is to love what you do. - Steve Jobs",
    "The purpose of our lives is to be happy. - Dalai Lama",
    "Get busy living or get busy dying. - Stephen King"
]

@app.route('/')
def index():
    return jsonify(quotes), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
