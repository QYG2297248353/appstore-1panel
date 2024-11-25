#!/bin/bash

if [[ -f .env ]]; then
  source .env

  mkdir -p "$SP_TRACKER_ROOT_PATH"

  mkdir -p "$SP_TRACKER_ROOT_PATH/conf"
  mkdir -p "$SP_TRACKER_ROOT_PATH/conf/keys"

  chmod $PUID:$PGID -R "$SP_TRACKER_ROOT_PATH"

  echo "Check Finish."

else
  echo ".env not found."
fi
