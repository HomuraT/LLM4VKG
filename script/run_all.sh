#!/bin/bash
set -e

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
  set -a
  source "$ENV_FILE"
  set +a
fi

CONTAINER_NAME="llm4vkg-pg"
IMAGE_NAME="llm4vkg-postgres11"
HOST_PORT="${POSTGRES_PORT:-5433}"

cleanup() {
  echo "Cleaning up Docker PostgreSQL container..."
  docker rm -f "$CONTAINER_NAME" 2>/dev/null || true
}

trap cleanup EXIT

echo "Removing old Docker PostgreSQL container if it exists..."
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Starting Docker PostgreSQL..."
docker build -t "$IMAGE_NAME" .
docker run -d \
  --name "$CONTAINER_NAME" \
  --env-file "$ENV_FILE" \
  -p "${HOST_PORT}:5432" \
  "$IMAGE_NAME"

echo "Waiting for PostgreSQL to accept SQL connections..."
until docker exec "$CONTAINER_NAME" psql -U "${POSTGRES_USER:-postgres}" -d postgres -c "SELECT 1" >/dev/null 2>&1; do
  sleep 5
done

echo "Running MPR..."
bash script/MPR.sh

echo "Running OC_MG..."
bash script/OC_MG.sh

echo "Running RODI evaluation..."
bash script/rodi_evaluate.sh

echo "Pipeline completed."
