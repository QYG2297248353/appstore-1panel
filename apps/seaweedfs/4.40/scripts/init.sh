#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  if [ ! -d $SEAWEEDFS_ROOT_PATH/prometheus ]; then
    mkdir -p $SEAWEEDFS_ROOT_PATH/prometheus
  fi
  cp -rn ./config/* $SEAWEEDFS_ROOT_PATH/prometheus/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
