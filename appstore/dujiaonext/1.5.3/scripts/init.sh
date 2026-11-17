#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  mkdir -p "$DUJIAONEXT_ROOT_PATH"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/config"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data/db"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data/uploads"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data/logs"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data/redis"
  mkdir -p "$DUJIAONEXT_ROOT_PATH/data/postgres"

  cp ./config/config.yml "$DUJIAONEXT_ROOT_PATH/config/config.yml"

  chmod -R 0777 "$DUJIAONEXT_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
