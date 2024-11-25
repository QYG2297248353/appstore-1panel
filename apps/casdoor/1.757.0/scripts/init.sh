#!/bin/bash

if [ -f .env ]; then
  source .env



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
