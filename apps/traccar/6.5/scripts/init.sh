#!/bin/bash

if [ -f .env ]; then
  source .env

qyg2297248353/mediacms:v4.1.0

  cp conf/traccar.xml "${TRACCAR_ROOT_PATH}/traccar.xml"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
