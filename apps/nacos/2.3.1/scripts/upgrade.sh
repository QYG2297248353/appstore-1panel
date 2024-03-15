#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if grep -q "NACOS_START_MODE" ./.env; then
    echo "NACOS_START_MODE found."
  else
    echo 'NACOS_START_MODE="standalone"' >>./.env
  fi

  if grep -q "NACOS_PREFER_HOST_MODE" ./.env; then
    echo "NACOS_PREFER_HOST_MODE found."
  else
    echo 'NACOS_PREFER_HOST_MODE="ip"' >>./.env
  fi

  if grep -q "SPRING_DATASOURCE_PLATFORM" ./.env; then
    echo "SPRING_DATASOURCE_PLATFORM found."
  else
    echo 'SPRING_DATASOURCE_PLATFORM=""' >>./.env
  fi

  if grep -q "NACOS_AUTH_ENABLE" ./.env; then
    echo "NACOS_AUTH_ENABLE found."
  else
    echo 'NACOS_AUTH_ENABLE="TRUE"' >>./.env
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
