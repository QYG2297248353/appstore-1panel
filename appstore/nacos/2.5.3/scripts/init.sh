#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)

  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env

  printf "\nENV_FILE=%s/.env\nGLOBAL_ENV_FILE=%s/envs/global.env\n" "$CURRENT_DIR" "$CURRENT_DIR" >> .env

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
