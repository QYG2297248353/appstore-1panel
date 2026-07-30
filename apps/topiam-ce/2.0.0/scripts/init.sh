#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 create directories
  mkdir -p "$TOPIAM_CE_ROOT_PATH"
  mkdir -p "$TOPIAM_CE_ROOT_PATH/logs"
  chmod -R 777 "$TOPIAM_CE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
