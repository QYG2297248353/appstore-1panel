#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "$WECHATPADPRO_ROOT_PATH"

  # WECHATPADPRO_ROOT_PATH/.env 创建空文件
  touch "$WECHATPADPRO_ROOT_PATH/.env"


  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
