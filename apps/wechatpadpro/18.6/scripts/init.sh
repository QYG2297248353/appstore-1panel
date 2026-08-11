#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  mkdir -p "$WECHATPADPRO_ROOT_PATH"

  # WECHATPADPRO_ROOT_PATH/.env 创建空文件
  touch "$WECHATPADPRO_ROOT_PATH/.env"


  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
