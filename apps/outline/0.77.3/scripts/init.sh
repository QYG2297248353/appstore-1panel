#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  echo "ENV_FILE=.env" >> .env

  # setup-2 remove empty values
  sed -i '/^.*=""/d' .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
