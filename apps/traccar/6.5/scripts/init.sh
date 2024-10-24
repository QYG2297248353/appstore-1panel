#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env

  cp conf/traccar.xml "${TRACCAR_ROOT_PATH}/traccar.xml"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
