#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  mkdir -p "$REDIS_ROOT_PATH"

  mkdir -p "$REDIS_ROOT_PATH/data"
  mkdir -p "$REDIS_ROOT_PATH/config"
  mkdir -p "$REDIS_ROOT_PATH/logs"

  cp ./config/redis.conf "$REDIS_ROOT_PATH/config/redis.conf"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
