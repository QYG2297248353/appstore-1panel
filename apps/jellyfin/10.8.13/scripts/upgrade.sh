#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if [ ! -d "$JELLYFIN_ROOT_PATH/config/font" ]; then
    mkdir -p "$JELLYFIN_ROOT_PATH/config/font"
    cp -f ./font/* "$JELLYFIN_ROOT_PATH/config/font/"
  fi

  if [ ! -d "$JELLYFIN_ROOT_PATH/config/dejavu" ]; then
    mkdir -p "$JELLYFIN_ROOT_PATH/config/dejavu"
    cp -f ./dejavu/* "$JELLYFIN_ROOT_PATH/config/dejavu/"
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
