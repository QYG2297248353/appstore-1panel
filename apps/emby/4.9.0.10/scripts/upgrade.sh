#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if [[ $NETWORK_MODE == "custom" ]]; then
    if [[ -z $CUSTOM_NETWORK_MODE ]]; then
      NETWORK_MODE="host"
    else
      NETWORK_MODE=$CUSTOM_NETWORK_MODE
    fi
  fi

  mkdir -p "$EMBY_ROOT_PATH"

  mkdir -p "$EMBY_ROOT_PATH/data"
  mkdir -p "$EMBY_ROOT_PATH/mnt"

  chmod -R $UID:$GID "$EMBY_ROOT_PATH"

  echo "Check Finish."

else
  echo ".env not found."
fi
