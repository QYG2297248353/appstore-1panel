#!/bin/bash

if [ -f .env ]; then
  source .env

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
