#!/bin/bash

if [ -f .env ]; then
  source ./.env

  cp ./config/onedev.dev ${ONEDEV_ROOT_PATH}/config/onedev.dev

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
