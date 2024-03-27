#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  mkdir -p "$JELLYFIN_ROOT_PATH"
  mkdir -p "$JELLYFIN_ROOT_PATH/config"
  mkdir -p "$JELLYFIN_ROOT_PATH/config/config"
  mkdir -p "$JELLYFIN_ROOT_PATH/config/font"
  mkdir -p "$JELLYFIN_ROOT_PATH/config/dejavu"
  mkdir -p "$JELLYFIN_ROOT_PATH/cache"
  mkdir -p "$JELLYFIN_ROOT_PATH/media"

  if [ ! -f "$JELLYFIN_ROOT_PATH/config/config/network.xml" ]; then
    cp -f ./config/network.xml "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{PANEL_APP_PORT_HTTP}/$PANEL_APP_PORT_HTTP/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{PANEL_APP_PORT_HTTPS}/$PANEL_APP_PORT_HTTPS/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{JELLYFIN_IPV6_ENABLE}/$JELLYFIN_IPV6_ENABLE/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
  else
    echo "network.xml already exists."
    sed -i "s/<PublicPort>[0-9]\{1,5\}<\/PublicPort>/<PublicPort>$PANEL_APP_PORT_HTTP<\/PublicPort>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<HttpServerPortNumber>[0-9]\{1,5\}<\/HttpServerPortNumber>/<HttpServerPortNumber>$PANEL_APP_PORT_HTTP<\/HttpServerPortNumber>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<PublicHttpsPort>[0-9]\{1,5\}<\/PublicHttpsPort>/<PublicHttpsPort>$PANEL_APP_PORT_HTTPS<\/PublicHttpsPort>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<HttpsPortNumber>[0-9]\{1,5\}<\/HttpsPortNumber>/<HttpsPortNumber>$PANEL_APP_PORT_HTTPS<\/HttpsPortNumber>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<EnableIPV6>[a-z]\{4,5\}<\/EnableIPV6>/<EnableIPV6>$JELLYFIN_IPV6_ENABLE<\/EnableIPV6>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
  fi

  cp -f ./dejavu/* "$JELLYFIN_ROOT_PATH/config/dejavu/"
  cp -f ./font/* "$JELLYFIN_ROOT_PATH/config/font/"

  echo "Check Finish."

else
  echo ".env not found."
fi
