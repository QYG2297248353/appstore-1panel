#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 copy config file
  mkdir -p "$ELEMENT_WEB_ROOT_PATH"
  mkdir -p "$ELEMENT_WEB_ROOT_PATH/config"
  cp ./conf/config.sample.json "$ELEMENT_WEB_ROOT_PATH/config/config.json"

  if [ -n "$SYNAPSE_SERVER_NAME" ]; then
    cp ./conf/config.sample.json "$ELEMENT_WEB_ROOT_PATH/config/config.$SYNAPSE_SERVER_NAME.json"
  fi

  # setup-3 set permission
  chmod -R 777 "$ELEMENT_WEB_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
