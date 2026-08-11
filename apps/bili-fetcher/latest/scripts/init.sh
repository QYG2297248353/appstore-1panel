#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  if [ ! -d $BILI_FETCHER_ROOT_PATH/config ]; then
    mkdir -p $BILI_FETCHER_ROOT_PATH/config
  fi
  cp -rn ./config/* $BILI_FETCHER_ROOT_PATH/config/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
