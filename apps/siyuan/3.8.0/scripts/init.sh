#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  if [ ! -d $SIYUAN_ROOT_PATH ]; then
    mkdir -p $SIYUAN_ROOT_PATH
  fi

  if [ ! -d $SIYUAN_ROOT_PATH/workspace ]; then
    mkdir -p $SIYUAN_ROOT_PATH/workspace
  fi

  chown -R 1000:1000 $SIYUAN_ROOT_PATH

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
