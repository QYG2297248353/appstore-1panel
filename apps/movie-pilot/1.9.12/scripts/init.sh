#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
