#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  mkdir -p "$GLANCE_ROOT_PATH"
  mkdir -p "$GLANCE_ROOT_PATH/app"

  cp ./conf/glance.yml "$GLANCE_ROOT_PATH/app/glance.yml"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
