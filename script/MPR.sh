#!/bin/bash
# 映射模式识别(MPR)启动脚本
# 设置HuggingFace国内镜像环境变量

# 设置HuggingFace镜像
export HF_ENDPOINT=https://hf-mirror.com
export HF_HUB_ENDPOINT=https://hf-mirror.com

# 可选：设置GPU设备（如果需要）
# export CUDA_VISIBLE_DEVICES=0

# 运行映射模式识别
uv run python MPR.py "$@"
