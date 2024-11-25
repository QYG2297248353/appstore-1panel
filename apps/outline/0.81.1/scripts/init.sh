#!/bin/bash

if [ -f .env ]; then
  source .env



  # setup-2 remove empty values
  sed -i '/^.*=""/d' .env

  # setup-3 update directory permissions
  chmod 777 -R "$OUTLINE_ROOT_PATH"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
