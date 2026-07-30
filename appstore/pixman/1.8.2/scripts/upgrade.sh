#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  if [ ! -d $PIXMAN_ROOT_PATH/m3u ]; then
    mkdir -p $PIXMAN_ROOT_PATH/m3u
  fi
  cp -rf ./m3u/* $PIXMAN_ROOT_PATH/m3u/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
