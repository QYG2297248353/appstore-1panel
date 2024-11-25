#!/bin/bash

if [ -f .env ]; then
  source .env

qyg2297248353/mediacms:v4.1.0

  chmod 777 -R "$OUTLINE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
