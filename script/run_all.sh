#!/bin/bash
set -e

export PATH="$HOME/.local/bin:$PATH"

bash script/run_docker_postgres.sh

echo "Running MPR..."
bash script/MPR.sh

echo "Running OC_MG..."
bash script/OC_MG.sh

echo "Running RODI evaluation..."
bash script/rodi_evaluate.sh

echo "Pipeline completed."
