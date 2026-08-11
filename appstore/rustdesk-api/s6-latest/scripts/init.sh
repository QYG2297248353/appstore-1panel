#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  echo "HBBR_RUN_FILE=${CURRENT_DIR}/conf/hbbr/run" >> .env
  echo "HBBS_RUN_FILE=${CURRENT_DIR}/conf/hbbs/run" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
