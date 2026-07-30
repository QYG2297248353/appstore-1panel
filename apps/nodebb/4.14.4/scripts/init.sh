#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 update dir permissions
  mkdir -p "$NODEBB_ROOT_PATH"
  mkdir -p "$NODEBB_ROOT_PATH/node_modules"
  mkdir -p "$NODEBB_ROOT_PATH/build"
  mkdir -p "$NODEBB_ROOT_PATH/uploads"
  mkdir -p "$NODEBB_ROOT_PATH/config"

  # setup-3 初始化参数配置
  if [ -z "$NODEBB_DB_NAME" ]; then
    NODEBB_DB_NAME="nodebb"
  fi

  if [ -z "$NODEBB_DB_USER" ]; then
    NODEBB_DB_USER=""
  fi

  if [ -z "$NODEBB_DB_PASSWORD" ]; then
    NODEBB_DB_PASSWORD=""
  fi

  SETUP_JSON_PATH="$NODEBB_ROOT_PATH/setup.json"
  cp ./conf/setup.json "$SETUP_JSON_PATH"
  sed -i "
    s|\$NODEBB_DB_HOST|$NODEBB_DB_HOST|g;
    s|\$NODEBB_DB_PORT|$NODEBB_DB_PORT|g;
    s|\$NODEBB_DB_NAME|$NODEBB_DB_NAME|g;
    s|\$NODEBB_DB_USER|$NODEBB_DB_USER|g;
    s|\$NODEBB_DB_PASSWORD|$NODEBB_DB_PASSWORD|g;
    s|\$NODEBB_DB|$NODEBB_DB|g
  " "$SETUP_JSON_PATH"


  # setup-4 update dir permissions
  chown -R 1001:1001 "$NODEBB_ROOT_PATH"
  chown -R 1001:1001 "$NODEBB_ROOT_PATH/node_modules"
  chown -R 1001:1001 "$NODEBB_ROOT_PATH/build"
  chown -R 1001:1001 "$NODEBB_ROOT_PATH/uploads"
  chown -R 1001:1001 "$NODEBB_ROOT_PATH/config"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
