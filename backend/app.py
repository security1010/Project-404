from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"message": "Missing Persons Finder Backend is running!"})

if __name__ == "__main__":
    app.run(debug=True)
