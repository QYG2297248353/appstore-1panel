#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  MCSMANAGER_ROOT_PATH=${MCSMANAGER_ROOT_PATH%/}
  sed -i '/^MCSM_DOCKER_WORKSPACE_PATH=/d' .env
  echo "MCSM_DOCKER_WORKSPACE_PATH=${MCSMANAGER_ROOT_PATH}/daemon/data/InstanceData" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
