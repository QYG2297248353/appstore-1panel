#!/bin/bash

# 检查 .env 文件是否存在
if [ -f .env ]; then
  # 导入 .env 文件中的变量
  source .env

  # 创建并设置权限
  mkdir -p "$ES_ROOT_PATH"
  mkdir -p "$ES_ROOT_PATH/certs"
  mkdir -p "$ES_ROOT_PATH/es01/data"
  mkdir -p "$ES_ROOT_PATH/es02/data"
  mkdir -p "$ES_ROOT_PATH/es03/data"
  mkdir -p "$ES_ROOT_PATH/kibana/data"

  chmod -R 777 "$ES_ROOT_PATH"

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
  exit 1
fi
