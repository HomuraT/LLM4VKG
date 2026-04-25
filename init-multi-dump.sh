#!/bin/bash
set -e

echo "Searching for dump.sql files..."

for dump in /datasets/rodi/*/dump.sql; do
  [ -f "$dump" ] || continue

  db="$(basename "$(dirname "$dump")")"

  echo "Creating database: $db"
  createdb -U "$POSTGRES_USER" "$db" 2>/dev/null || echo "Database $db already exists"

  echo "Importing $dump into $db"
  psql -v ON_ERROR_STOP=1 \
       -U "$POSTGRES_USER" \
       -d "$db" \
       -f "$dump"
done

echo "All dumps imported into separate databases."
