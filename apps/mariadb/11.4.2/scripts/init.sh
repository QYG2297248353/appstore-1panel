#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env

  mkdir -p "$MARIADB_ROOT_PATH"
  mkdir -p "$MARIADB_ROOT_PATH/config"
  mkdir -p "$MARIADB_ROOT_PATH/data"

  cp ./config/my.cnf "$MARIADB_ROOT_PATH/config/my.cnf"

  chown -R 1000:1000 "$MYSQL_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
