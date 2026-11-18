#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 Peach 容器以 UID 1000 运行，数据目录需要该用户可写
  PEACH_DATA_PATH=${PEACH_DATA_PATH:-/home/peach}
  PEACH_MEDIA_PATH=${PEACH_MEDIA_PATH:-/home/peach/media}
  mkdir -p "${PEACH_DATA_PATH}/data" "${PEACH_MEDIA_PATH}"
  chown -R 1000:1000 "${PEACH_DATA_PATH}/data"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi

