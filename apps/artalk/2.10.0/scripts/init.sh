#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  DATA_DIR="$ARTALK_ROOT_PATH/data"

  mkdir -p "$DATA_DIR"

  OUTPUT_FILE="$DATA_DIR/ip2region.xdb"

  URL1="https://gh-proxy.com/?q=https%3A%2F%2Fgithub.com%2Flionsoul2014%2Fip2region%2Fblob%2Fmaster%2Fdata%2Fip2region.xdb"
  URL2="https://github.com/lionsoul2014/ip2region/raw/master/data/ip2region.xdb"

  curl -L "$URL1" -o "$OUTPUT_FILE" || curl -L "$URL2" -o "$OUTPUT_FILE"

  chmod -R 777 "$DATA_DIR"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
