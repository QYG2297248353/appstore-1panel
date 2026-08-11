#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  if [ ! -d $PIXMAN_ROOT_PATH/m3u ]; then
    mkdir -p $PIXMAN_ROOT_PATH/m3u
  fi
  cp -rf ./m3u/* $PIXMAN_ROOT_PATH/m3u/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
