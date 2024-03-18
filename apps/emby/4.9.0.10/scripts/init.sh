#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  mkdir -p "$EMBY_ROOT_PATH"

  mkdir -p "$EMBY_ROOT_PATH/data"
  mkdir -p "$EMBY_ROOT_PATH/mnt"

  echo "Check Finish."

else
  echo ".env not found."
fi
