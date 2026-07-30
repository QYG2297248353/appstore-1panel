#!/bin/bash

if [ -f .env ]; then
  source .env

  mkdir -p "$REDIS_ROOT_PATH"

  mkdir -p "$REDIS_ROOT_PATH/data"
  mkdir -p "$REDIS_ROOT_PATH/config"
  mkdir -p "$REDIS_ROOT_PATH/logs"

  cp ./config/redis.conf "$REDIS_ROOT_PATH/config/redis.conf"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
