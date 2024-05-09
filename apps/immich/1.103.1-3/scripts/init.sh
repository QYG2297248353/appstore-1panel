#!/bin/bash

if [ -f .env ]; then
  source .env

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
fi
