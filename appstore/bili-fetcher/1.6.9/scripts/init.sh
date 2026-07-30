#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  if [ ! -d $BILI_FETCHER_ROOT_PATH/config ]; then
    mkdir -p $BILI_FETCHER_ROOT_PATH/config
  fi
  cp -rn ./config/* $BILI_FETCHER_ROOT_PATH/config/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
