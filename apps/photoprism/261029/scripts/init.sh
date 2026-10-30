#!/bin/bash

if [ -f .env ]; then

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  sed -i '/^APP_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env
  echo "APP_ENV_FILE=${CURRENT_DIR}/envs/photoprism.env" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
