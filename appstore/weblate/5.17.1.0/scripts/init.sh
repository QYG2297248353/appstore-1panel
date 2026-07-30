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
  mkdir -p "$WEBLATE_ROOT_PATH"
  mkdir -p "$WEBLATE_ROOT_PATH/data"
  mkdir -p "$WEBLATE_ROOT_PATH/cache"

  chown -R 1000:1000 "$WEBLATE_ROOT_PATH"
  chown -R 1000:1000 "$WEBLATE_ROOT_PATH/data"
  chown -R 1000:1000 "$WEBLATE_ROOT_PATH/cache"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
