#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if [ ! -d "$JELLYFIN_ROOT_PATH/config/font" ]; then
    mkdir -p "$JELLYFIN_ROOT_PATH/config/font"
    cp -f ./font/* "$JELLYFIN_ROOT_PATH/config/font/"
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
