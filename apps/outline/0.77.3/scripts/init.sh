#!/bin/bash

if [ -f .env ]; then
  source ./.env

  # setup-1 update env
  BASE_DIR=$(which 1pctl | xargs grep '^BASE_DIR=' | cut -d'=' -f2)
  PANEL_DIR="${BASE_DIR}/1panel"
  PANEL_APP_DIR="${BASE_DIR}/1panel/resource/apps/local"
  echo "PANEL_APP_INSTALL_DIR=${PANEL_DIR}" >> .env
  echo "PANEL_APP_LOCAL_DIR=${PANEL_APP_DIR}" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
