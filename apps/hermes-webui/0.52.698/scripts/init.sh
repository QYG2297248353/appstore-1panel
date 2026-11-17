#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  # setup-2 更新挂载目录权限
  HERMES_WEBUI_DIR="$HERMES_WEBUI_ROOT_PATH/hermes"
  mkdir -p "$HERMES_WEBUI_DIR"
  chown -R ${UID}:${GID} ${HERMES_WEBUI_DIR}
  
  WORKSPACE_DIR="$HERMES_WEBUI_ROOT_PATH/workspace"
  mkdir -p "$WORKSPACE_DIR"
  chown -R ${UID}:${GID} ${WORKSPACE_DIR}


  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
