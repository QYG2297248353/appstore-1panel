#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if command -v mysql &> /dev/null; then
    if [[ -f ./scripts/mysql-schema.sql ]]; then
      mysql -u"$MYSQL_SERVICE_USER" -p"$MYSQL_SERVICE_PASSWORD" -h"$MYSQL_SERVICE_HOST" -P"$MYSQL_SERVICE_PORT" --protocol=TCP "$MYSQL_SERVICE_DB_NAME" < ./scripts/mysql-schema.sql
    else
      echo "mysql-schema.sql not found."
    fi
  else
    echo "mysql command not found."
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
