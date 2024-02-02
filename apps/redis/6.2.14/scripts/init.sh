#!/bin/bash

# 检查 .env 文件是否存在
if [ -f .env ]; then
  # 导入 .env 文件中的变量
  source .env

  # 创建目录
  mkdir -p "$REDIS_ROOT_PATH"

  mkdir -p "$REDIS_ROOT_PATH/data"
  mkdir -p "$REDIS_ROOT_PATH/conf"
  mkdir -p "$REDIS_ROOT_PATH/logs"

  cp redis.conf "$REDIS_ROOT_PATH/conf/redis.conf"

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
  exit 1
fi
