#!/bin/bash

if [ -f .env ]; then
  source .env

  docker network rm $IMMICH_NETWORK

else
  echo "Error: .env file not found."
fi
