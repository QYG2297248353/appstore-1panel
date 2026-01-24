#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "$SUPER_PRODUCTIVITY_ROOT_PATH"
  mkdir -p "$SUPER_PRODUCTIVITY_ROOT_PATH/data"
  mkdir -p "$SUPER_PRODUCTIVITY_ROOT_PATH/config"

  if [ ! -f "$SUPER_PRODUCTIVITY_ROOT_PATH/app/glance.yml" ]; then
    cp ./conf/webdav.yaml "$SUPER_PRODUCTIVITY_ROOT_PATH/config/webdav.yaml"
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
