#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "$TRANSMISSION_ROOT_PATH/downloads"
  mkdir -p "$TRANSMISSION_ROOT_PATH/downloads/complete"
  mkdir -p "$TRANSMISSION_ROOT_PATH/downloads/incomplete"

  # setup-2 install theme
  if [ ! -d "$TRANSMISSION_ROOT_PATH/themes" ]; then
    mkdir -p "$TRANSMISSION_ROOT_PATH/themes"

    if command -v unzip >/dev/null 2>&1; then
      unzip -o themes/flood-for-transmission.zip -d "$TRANSMISSION_ROOT_PATH/themes"
      UNZIP_SUCCESS=$?
    elif command -v tar >/dev/null 2>&1; then
      tar -xf themes/flood-for-transmission.zip -C "$TRANSMISSION_ROOT_PATH/themes"
      UNZIP_SUCCESS=$?
    else
      echo "Warning: Neither 'unzip' nor 'tar' is installed. Skipping theme extraction."
      UNZIP_SUCCESS=1
    fi

    if [ $UNZIP_SUCCESS -eq 0 ]; then
      echo "Theme successfully extracted."

      if grep -q "^TRANSMISSION_WEB_HOME=" .env; then
          sed -i 's|^TRANSMISSION_WEB_HOME=.*|TRANSMISSION_WEB_HOME=/themes/flood-for-transmission|' .env
      else
        echo "TRANSMISSION_WEB_HOME=/themes/flood-for-transmission" >> .env
      fi
    else
      echo "Warning: Failed to extract the theme archive. Proceeding without extracted theme."
    fi
  else
    echo "Themes directory already exists. Skipping extraction."
  fi

  chown -R 1000:1000 "$TRANSMISSION_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
