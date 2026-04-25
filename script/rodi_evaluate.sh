#!/bin/bash
set -e

# RODI evaluation startup script
# Set HuggingFace mirror environment variables

export HF_ENDPOINT=https://hf-mirror.com
export HF_HUB_ENDPOINT=https://hf-mirror.com

# Optional GPU selection
# export CUDA_VISIBLE_DEVICES=0

uv run python rodi_evaluate.py "$@"