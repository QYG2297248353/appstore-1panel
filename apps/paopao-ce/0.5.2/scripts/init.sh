#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 copy config file
  mkdir -p "$PAOPAO_CE_ROOT_PATH"
  mkdir -p "$PAOPAO_CE_ROOT_PATH/config"
  mkdir -p "$PAOPAO_CE_ROOT_PATH/scripts"
  cp ./conf/config.yaml "$PAOPAO_CE_ROOT_PATH/config/config.yaml"
  cp ./conf/paopao-mysql.sql "$PAOPAO_CE_ROOT_PATH/scripts/paopao-mysql.sql"

  chown -R 1000:1000 "$PAOPAO_CE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
