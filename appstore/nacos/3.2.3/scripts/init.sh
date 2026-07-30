#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  if command -v mysql &> /dev/null; then
    if [[ -f ./init/mysql-schema.sql ]]; then
      mysql -u"$MYSQL_SERVICE_USER" -p"$MYSQL_SERVICE_PASSWORD" -h"$MYSQL_SERVICE_HOST" -P"$MYSQL_SERVICE_PORT" --protocol=TCP "$MYSQL_SERVICE_DB_NAME" < ./init/mysql-schema.sql
    else
      echo "mysql-schema.sql not found."
    fi
  else
    echo "mysql command not found."
  fi

  echo "Check Finish."
else
  echo "Error: .env file not found."
fi
