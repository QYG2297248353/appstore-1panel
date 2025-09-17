#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  sed -i '/^APP_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env
  echo "APP_ENV_FILE=${CURRENT_DIR}/envs/casdoor.env" >> .env

  if [ "$DB_TYPE" == "mysql" ]; then
    echo "dataSourceName=$DB_USER:$DB_PASSWD@tcp($DB_HOSTNAME:$DB_PORT)/" >> .env
  fi

  if [ "$DB_TYPE" == "postgres" ]; then
    echo "dataSourceName=\"user=$DB_USER password=$DB_PASSWD host=$DB_HOSTNAME port=$DB_PORT sslmode=disable dbname=$DB_NAME\"" >> .env
  fi

  if [ -n "$REDIS_PASSWORD" ]; then
    echo "redisEndpoint=$REDIS_HOSTNAME:$REDIS_PORT,$REDIS_DBINDEX,$REDIS_PASSWORD" >> .env
  else
    echo "redisEndpoint=$REDIS_HOSTNAME:$REDIS_PORT,$REDIS_DBINDEX" >> .env
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
