#!/bin/bash
set -e

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
  set -a
  source "$ENV_FILE"
  set +a
fi

export PATH="$HOME/.local/bin:$PATH"

CONTAINER_NAME="llm4vkg-pg"
IMAGE_NAME="llm4vkg-postgres11"
HOST_PORT="${POSTGRES_PORT:-5433}"

echo "Removing old Docker PostgreSQL container if it exists..."
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Starting Docker PostgreSQL..."
docker build -t "$IMAGE_NAME" .
docker run -d \
  --name "$CONTAINER_NAME" \
  --env-file "$ENV_FILE" \
  -p "${HOST_PORT}:5432" \
  "$IMAGE_NAME"

echo "Waiting for PostgreSQL to accept host-side SQL connections..."
until uv run python - <<'PY' >/dev/null 2>&1
import os
import psycopg2

conn = psycopg2.connect(
    dbname="postgres",
    user=os.getenv("POSTGRES_USER", "postgres"),
    password=os.getenv("POSTGRES_PASSWORD"),
    host="localhost",
    port=int(os.getenv("POSTGRES_PORT", "5433")),
)
conn.close()
PY
do
  echo "PostgreSQL not ready yet, retrying..."
  sleep 5
done

echo "Docker PostgreSQL is ready."
