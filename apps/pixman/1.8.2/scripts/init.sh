#!/bin/bash

if [ -f .env ]; then
  source .env

  if [ ! -d $PIXMAN_ROOT_PATH/m3u ]; then
    mkdir -p $PIXMAN_ROOT_PATH/m3u
  fi
  cp -rf ./m3u/* $PIXMAN_ROOT_PATH/m3u/

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
