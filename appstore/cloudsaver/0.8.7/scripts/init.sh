#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 copy env file
  CONFIG_DIR="$CLOUDSAVER_ROOT_PATH/config"
  mkdir -p "$CONFIG_DIR"

  CONFIG_FILE="$CONFIG_DIR/env"
  cp ./config/env.example $CONFIG_FILE
  sed -i "s/JWT_SECRET=.*/JWT_SECRET=$JWT_SECRET/" $CONFIG_FILE

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
