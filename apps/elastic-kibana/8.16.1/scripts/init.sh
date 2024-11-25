#!/bin/bash

if [ -f .env ]; then
  source .env

  mkdir -p $KIBANA_ROOT_PATH
  mkdir -p "$KIBANA_ROOT_PATH/data"

  chown -R 1000:1000 $KIBANA_ROOT_PATH

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
