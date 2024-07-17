#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env

  mkdir -p "$PERCONA_ROOT_PATH"
  mkdir -p "$PERCONA_ROOT_PATH/config"
  mkdir -p "$PERCONA_ROOT_PATH/data"
  mkdir -p "$PERCONA_ROOT_PATH/log"

  cp ./config/my.cnf "$PERCONA_ROOT_PATH/config/my.cnf"

  chown -R 1000:1000 "$PERCONA_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
