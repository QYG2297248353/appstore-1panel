#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  mkdir -p "$RUSTFS_ROOT_PATH"
  mkdir -p "$RUSTFS_ROOT_PATH/logs"
  mkdir -p "$RUSTFS_ROOT_PATH/data"
  mkdir -p "$RUSTFS_ROOT_PATH/data/rustfs0"
  mkdir -p "$RUSTFS_ROOT_PATH/data/rustfs1"
  mkdir -p "$RUSTFS_ROOT_PATH/data/rustfs2"
  mkdir -p "$RUSTFS_ROOT_PATH/data/rustfs3"

  chown -R 10001:10001 "$RUSTFS_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
