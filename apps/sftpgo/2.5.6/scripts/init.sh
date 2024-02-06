#!/bin/bash

# 检查 .env 文件是否存在
if [ -f .env ]; then

  # 导入 .env 文件中的变量
  source .env

  # 路径完善
  if [ "$SFTPGO_ROOT_PATH" = "." ]; then
    SFTPGO_ROOT_PATH=$(pwd)
  fi

  # 创建目录
  mkdir -p "$SFTPGO_ROOT_PATH"
  mkdir -p "$SFTPGO_ROOT_PATH/data"
  mkdir -p "$SFTPGO_ROOT_PATH/backups"
  mkdir -p "$SFTPGO_ROOT_PATH/home"

  # 修改目录权限
  chown -R 1000:1000 "$SFTPGO_ROOT_PATH"

else
  echo "Error: .env file not found."
  exit 1
fi
