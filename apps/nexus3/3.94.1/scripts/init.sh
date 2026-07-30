#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "$NEXUS3_ROOT_PATH"
  mkdir -p "$NEXUS3_ROOT_PATH/data"

  chown -R 200:0 "$NEXUS3_ROOT_PATH"
  chown -R 200:0 "$NEXUS3_ROOT_PATH/data"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
