#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

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
