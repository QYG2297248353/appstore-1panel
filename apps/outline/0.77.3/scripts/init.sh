#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1
  echo "ENV_FILE=.env" >> .env

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
