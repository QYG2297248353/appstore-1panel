#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  DATA_DIR="$SUWAYOMI_SERVER_ROOT_PATH/data"
  WEB_DIR="$SUWAYOMI_SERVER_ROOT_PATH/webUI"

  mkdir -p "$DATA_DIR"
  mkdir -p "$WEB_DIR"

  chown -R 1000:1000 $DATA_DIR
  chmod -R 755 $DATA_DIR

  # setup-2
  if ! command -v unzip &>/dev/null; then
    echo "未找到 unzip，尝试自动安装..."
    if command -v apt-get &>/dev/null; then
      apt-get install -y unzip
    elif command -v yum &>/dev/null; then
      yum install -y unzip
    else
      echo "Error: 无法自动安装 unzip，请手动安装后重试。"
      exit 1
    fi
  fi

  # setup-3
  LATEST_ZIP=$(ls -t web/Suwayomi-WebUI-v*.zip 2>/dev/null | head -n 1)

  if [ -z "$LATEST_ZIP" ]; then
    echo "Warning: 在 web/ 目录下未找到 Suwayomi-WebUI-v*.zip，跳过前端部署。"
  else
    echo "发现前端包：$LATEST_ZIP，开始覆盖解压到 $WEB_DIR ..."
    unzip -oq "$LATEST_ZIP" -d "$WEB_DIR"
    if [ $? -eq 0 ]; then
      echo "前端解压完成。"
    else
      echo "Error: 解压失败，请检查 zip 文件是否完整。"
      exit 1
    fi
  fi

  chown -R 1000:1000 $WEB_DIR
  chmod -R 755 $WEB_DIR

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
