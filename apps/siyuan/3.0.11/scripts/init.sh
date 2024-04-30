#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  # 创建目录
  mkdir -p "$ES_ROOT_PATH"
  mkdir -p "$ES_ROOT_PATH/workspace"

  # 设置权限
  chmod -R $UID:$GID "$SIYUAN_ROOT_PATH"

  echo "Check Finish."

else
  echo ".env not found."
fi
