#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "$OMNIROUTE_ROOT_PATH"
  mkdir -p "$OMNIROUTE_ROOT_PATH/omniroute"
  chown -R 1000:1000 "$OMNIROUTE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
