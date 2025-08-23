#!/bin/bash

echo "🚀 Initializing Project-404 structure..."

# === Backend Setup ===
echo "📦 Setting up backend..."
cd backend || exit
if [ ! -d "venv" ]; then
  python3 -m venv venv
  source venv/bin/activate
  echo "flask\nrequests\n" > requirements.txt
  pip install -r requirements.txt
  deactivate
  echo "✅ Backend ready with virtual environment and requirements.txt"
else
  echo "⚠️ Backend venv already exists, skipping..."
fi
cd ..

# === Frontend Setup ===
echo "📦 Setting up frontend..."
cd frontend || exit
if [ ! -f "package.json" ]; then
  npm init -y
  npm install react react-dom
  echo "✅ Frontend ready with basic React setup"
else
  echo "⚠️ Frontend already initialized, skipping..."
fi
cd ..

# === Docs Setup ===
echo "📝 Creating docs placeholders..."
cd docs || exit
if [ ! -f "README.md" ]; then
  echo "# Project 404 Documentation" > README.md
  echo "Initial documentation scaffold created."
fi
cd ..

# === Assets Setup ===
echo "🖼️ Creating assets placeholders..."
cd assets || exit
if [ ! -f ".gitkeep" ]; then
  touch .gitkeep
  echo "Assets placeholder added."
fi
cd ..

echo "✅ Initialization complete!"
