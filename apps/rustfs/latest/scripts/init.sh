#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env


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
