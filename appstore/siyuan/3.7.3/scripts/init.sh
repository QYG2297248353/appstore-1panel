#!/bin/bash

if [ -f .env ]; then
  source .env

  if [ ! -d $SIYUAN_ROOT_PATH ]; then
    mkdir -p $SIYUAN_ROOT_PATH
  fi

  if [ ! -d $SIYUAN_ROOT_PATH/workspace ]; then
    mkdir -p $SIYUAN_ROOT_PATH/workspace
  fi

  chown -R 1000:1000 $SIYUAN_ROOT_PATH

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
