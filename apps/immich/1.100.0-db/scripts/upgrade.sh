#!/bin/bash

if [ -f .env ]; then
  source .env

  if grep -q "IMMICH_NETWORK" ./.env; then
    echo "IMMICH_NETWORK found."
  else
    echo 'IMMICH_NETWORK="immich-net"' >>./.env
  fi

  if [ -n "$(docker network ls -q -f name=$IMMICH_NETWORK)" ]; then
    docker network rm $IMMICH_NETWORK
  fi

  sed -i "s/\${IMMICH_NETWORK}/$IMMICH_NETWORK/" docker-compose.yml

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
fi
