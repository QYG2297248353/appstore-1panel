#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  # setup-2 create directories
  mkdir -p "$TOPIAM_CE_ROOT_PATH"
  mkdir -p "$TOPIAM_CE_ROOT_PATH/logs"
  chmod -R 777 "$TOPIAM_CE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
