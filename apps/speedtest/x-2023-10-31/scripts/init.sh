#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if [[ -f ./scripts/entrypoint.sh ]]; then
    chmod +x ./scripts/entrypoint.sh
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
