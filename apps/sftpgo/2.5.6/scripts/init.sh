#!/bin/bash

if [ -f .env ]; then

  source .env

  if [ "$SFTPGO_ROOT_PATH" = "." ]; then
    SFTPGO_ROOT_PATH=$(pwd)
  fi

  mkdir -p "$SFTPGO_ROOT_PATH"
  mkdir -p "$SFTPGO_ROOT_PATH/data"
  mkdir -p "$SFTPGO_ROOT_PATH/backups"
  mkdir -p "$SFTPGO_ROOT_PATH/home"

  chown -R 1000:1000 "$SFTPGO_ROOT_PATH"

else
  echo "Error: .env file not found."
  exit 1
fi
