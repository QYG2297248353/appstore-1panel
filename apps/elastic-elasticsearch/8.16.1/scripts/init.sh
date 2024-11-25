#!/bin/bash

if [ -f .env ]; then
  source .env

  mkdir -p $ELASTICSEARCH_ROOT_PATH
  mkdir -p "$ELASTICSEARCH_ROOT_PATH/data"
  mkdir -p "$ELASTICSEARCH_ROOT_PATH/backup"
  mkdir -p "$ELASTICSEARCH_ROOT_PATH/plugins"

  chown -R 1000:1000 $ELASTICSEARCH_ROOT_PATH

  echo "Check Finish."
else
  echo "Error: .env file not found."
fi
