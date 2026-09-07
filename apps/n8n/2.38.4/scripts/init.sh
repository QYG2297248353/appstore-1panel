#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  DATA_DIR="$N8N_ROOT_PATH/data"

  mkdir -p "$DATA_DIR"

  chmod -R 777 "$DATA_DIR"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
