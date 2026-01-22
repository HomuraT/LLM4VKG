#!/bin/bash
# MPR_infk.sh - infk映射模式识别脚本
# 该脚本运行infk版本的映射模式识别

echo "========================================"
echo "开始运行 MPR_infk.py（infk版本）"
echo "========================================"

# 设置环境变量
export HF_ENDPOINT=https://hf-mirror.com

# 运行 MPR_infk.py
uv run python MPR_infk.py

echo "========================================"
echo "MPR_infk.py 运行完成"
echo "========================================"




