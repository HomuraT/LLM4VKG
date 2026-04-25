#!/bin/bash
docker build -t llm4vkg-postgres11 .
docker run --name llm4vkg-pg \
  --env-file .env \
  -p 5433:5432 \
  llm4vkg-postgres11