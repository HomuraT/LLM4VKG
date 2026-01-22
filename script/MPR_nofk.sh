#!/bin/bash
# MPR_nofk.sh - 无外键映射模式识别脚本
# 该脚本运行无外键版本的映射模式识别

echo "========================================"
echo "开始运行 MPR_nofk.py（无外键版本）"
echo "========================================"

# 设置环境变量
export HF_ENDPOINT=https://hf-mirror.com

# 运行 MPR_nofk.py
uv run python MPR_nofk.py

echo "========================================"
echo "MPR_nofk.py 运行完成"
echo "========================================"








