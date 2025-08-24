#!/bin/bash

echo " Initializing Project-404 structure..."

# --------------------------
# Backend setup
# --------------------------
echo " Setting up backend..."
mkdir -p backend
cd backend

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo " Backend venv created"
else
    echo " Backend venv already exists, skipping..."
fi

# Create app.py if it doesn't exist
if [ ! -f "app.py" ]; then
    cat <<EOL > app.py
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"message": "Missing Persons Finder Backend is running!"})

if __name__ == "__main__":
    app.run(debug=True)
EOL
    echo " Created backend/app.py placeholder"
fi

# Create requirements.txt if it doesn't exist
if [ ! -f "requirements.txt" ]; then
    cat <<EOL > requirements.txt
Flask==2.3.2
graphene==3.2.1
EOL
    echo " Created backend/requirements.txt"
fi

cd ..

# --------------------------
# Frontend setup
# --------------------------
echo " Setting up frontend..."
mkdir -p frontend/src frontend/public

# package.json
if [ ! -f "frontend/package.json" ]; then
    cat <<EOL > frontend/package.json
{
  "name": "frontend",
  "version": "1.0.0",
  "description": "Missing Persons Finder Frontend",
  "main": "index.js",
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "react-scripts": "5.0.1"
  }
}
EOL
    echo " Created frontend/package.json"
fi

# src/App.js
if [ ! -f "frontend/src/App.js" ]; then
    cat <<EOL > frontend/src/App.js
import React from 'react';

function App() {
  return (
    <div>
      <h1>Missing Persons Finder Frontend is running!</h1>
    </div>
  );
}

export default App;
EOL
    echo " Created frontend/src/App.js"
fi

# src/index.js
if [ ! -f "frontend/src/index.js" ]; then
    cat <<EOL > frontend/src/index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
EOL
    echo " Created frontend/src/index.js"
fi

# public/index.html
if [ ! -f "frontend/public/index.html" ]; then
    cat <<EOL > frontend/public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Missing Persons Finder</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOL
    echo " Created frontend/public/index.html"
fi

# Install frontend dependencies
cd frontend
npm install
cd ..

echo " Frontend ready with basic React setup"

# --------------------------
# Docs setup
# --------------------------
echo " Creating docs placeholders..."
mkdir -p docs
if [ ! -f "docs/README.md" ]; then
    echo "# Documentation" > docs/README.md
fi
echo "Initial documentation scaffold created."

# --------------------------
# Assets setup
# --------------------------
echo " Creating assets placeholders..."
mkdir -p assets
if [ ! -f "assets/.gitkeep" ]; then
    touch assets/.gitkeep
fi
echo "Assets placeholder added."

echo " Initialization complete!"
