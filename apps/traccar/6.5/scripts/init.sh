#!/bin/bash

if [ -f .env ]; then
  source .env

  cp conf/traccar.xml "${TRACCAR_ROOT_PATH}/traccar.xml"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
