#!/bin/bash

if [ -f .env ]; then
  source .env



  chmod 777 -R "$OUTLINE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
