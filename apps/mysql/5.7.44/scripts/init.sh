#!/bin/bash

if [ -f .env ]; then
  source ./.env

  mkdir -p "$MYSQL_ROOT_PATH"
  mkdir -p "$MYSQL_ROOT_PATH/config"
  mkdir -p "$MYSQL_ROOT_PATH/data"
  mkdir -p "$MYSQL_ROOT_PATH/log"

  cp ./config/my.cnf "$MYSQL_ROOT_PATH/config/my.cnf"

  chown -R 1000:1000 "$MYSQL_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi