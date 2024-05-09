#!/bin/bash

if [ -f .env ]; then
  source .env

  # 创建存储目录
  mkdir -p "$IMMICH_ROOT_PATH"
  mkdir -p "$IMMICH_ROOT_PATH/config"

  # 复制配置文件
  cp -r ./config/* "$IMMICH_ROOT_PATH/config"

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
fi
