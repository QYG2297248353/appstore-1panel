#!/bin/bash

if [ -f .env ]; then
  source ./.env

  DB_TYPE=$(echo $DB_TYPE | sed 's/\"//g')

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
