#!/bin/bash

if [ -f .env ]; then
  source ./.env

  if [ -f custom.env ]; then
    echo -e "\n# Start of .env content\n" >> custom.env
    cat .env >> custom.env
  else
    echo "Error: custom.env file not found."
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
