#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  mkdir -p "$EMBY_ROOT_PATH"

  mkdir -p "$EMBY_ROOT_PATH/config"
  mkdir -p "$EMBY_ROOT_PATH/config/config"
  mkdir -p "$EMBY_ROOT_PATH/mnt"

  cp -f ./config/system.xml "$EMBY_ROOT_PATH/config/config/system.xml"

  sed -i "s/{PANEL_APP_PORT_HTTP}/$PANEL_APP_PORT_HTTP/g" "$EMBY_ROOT_PATH/config/config/system.xml"
  sed -i "s/{PANEL_APP_PORT_HTTPS}/$PANEL_APP_PORT_HTTPS/g" "$EMBY_ROOT_PATH/config/config/system.xml"

  chmod -R $UID:$GID "$EMBY_ROOT_PATH"

  echo "Check Finish."

else
  echo ".env not found."
fi
