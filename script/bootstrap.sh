#!/bin/bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1"
    exit 1
  }
}

echo "Checking system dependencies..."
need_cmd curl
need_cmd unzip
need_cmd git
need_cmd java
need_cmd mvn

if ! command -v uv >/dev/null 2>&1; then
  echo "uv not found, installing..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "Installing Python dependencies..."
uv sync

echo "Installing Ontop 5.4.0..."
rm -rf resources/ontop
mkdir -p resources
cd resources
curl -L -o ontop-cli-5.4.0.zip \
  https://github.com/ontop/ontop/releases/download/ontop-5.4.0/ontop-cli-5.4.0.zip
mkdir -p ontop
unzip ontop-cli-5.4.0.zip -d ontop
chmod +x ontop/ontop
rm -f ontop-cli-5.4.0.zip
cd ..

echo "Installing LogMap 4.0..."
rm -rf resources/logmap
mkdir -p resources
cd resources
git clone https://github.com/ernestojimenezruiz/logmap-matcher.git logmap
cd logmap
mvn -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8 -DskipTests package
cd ../..

if command -v docker >/dev/null 2>&1; then
  echo "Docker found"
else
  echo "Docker not found; skip container-based PostgreSQL setup"
fi

echo "Bootstrap completed."
