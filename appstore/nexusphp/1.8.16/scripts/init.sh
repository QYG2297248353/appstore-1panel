#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

  # setup-2 download geoip2
  GEOIP_DIR="$NEXUSPHP_ROOT_PATH/geoip2"
  mkdir -p "$GEOIP_DIR"

  GEOIP_FILE="$GEOIP_DIR/geoip2.mmdb"
  if curl -o "$GEOIP_FILE" -L "https://cdn.jsdelivr.net/gh/Hackl0us/GeoIP2-CN@release/Country.mmdb"; then
    echo "GeoIP2 database downloaded successfully to $GEOIP_FILE"
  else
    echo "Error: Failed to download GeoIP2 database."
  fi

  # setup-3 copy env file
  CONFIG_DIR="$NEXUSPHP_ROOT_PATH/config"
  mkdir -p "$CONFIG_DIR"

  CONFIG_FILE="$CONFIG_DIR/.env.example"
  cp ./envs/nexusphp.env $CONFIG_FILE
  sed -i "s/APP_KEY=.*/APP_KEY=$APP_KEY/" $CONFIG_FILE

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
