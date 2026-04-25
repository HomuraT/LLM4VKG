#!/bin/bash
set -e

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
  set -a
  source "$ENV_FILE"
  set +a
  DOCKER_ENV_ARGS=(--env-file "$ENV_FILE")
else
  DOCKER_ENV_ARGS=()
fi

CONTAINER_NAME="llm4vkg-pg"
IMAGE_NAME="llm4vkg-postgres11"
HOST_PORT="${POSTGRES_PORT:-5433}"

echo "Starting Docker PostgreSQL..."
if docker ps -a --format '{{.Names}}' | grep -qx "$CONTAINER_NAME"; then
  if docker ps --format '{{.Names}}' | grep -qx "$CONTAINER_NAME"; then
    echo "Container $CONTAINER_NAME is already running"
  else
    echo "Starting existing container $CONTAINER_NAME"
    docker start "$CONTAINER_NAME"
  fi
else
  echo "Creating new container $CONTAINER_NAME"
  docker build -t "$IMAGE_NAME" .
  docker run -d \
    --name "$CONTAINER_NAME" \
    "${DOCKER_ENV_ARGS[@]}" \
    -p "${HOST_PORT}:5432" \
    "$IMAGE_NAME"
fi

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
