#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  sed -i '/^APP_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env
  echo "APP_ENV_FILE=${CURRENT_DIR}/envs/outline.env" >> .env

  # setup-2 remove empty values
  sed -i '/^.*=""/d' .env

  # setup-3 update directory permissions
  mkdir -p "$OUTLINE_ROOT_PATH"
  mkdir -p "$OUTLINE_ROOT_PATH/data"

  chown -R 1001:1001 "$OUTLINE_ROOT_PATH"
  chmod -R 1777 "$OUTLINE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
