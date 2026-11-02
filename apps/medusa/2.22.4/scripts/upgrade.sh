#!/bin/bash

if [ -f .env ]; then
  # setup-0 normalize Alipay keys (must run before `source .env`):
  # pasted PEM may be glued to BEGIN/END headers, contain spaces or literal
  # \n, which would break `source .env` and the .env parsing of docker compose.
  for KEY_NAME in ALIPAY_PRIVATE_KEY ALIPAY_PUBLIC_KEY; do
    LINE=$(grep -m1 "^${KEY_NAME}=" .env 2>/dev/null || true)
    [ -z "$LINE" ] && continue
    RAW=${LINE#*=}
    CLEAN=$(printf '%s' "$RAW" \
      | sed -e 's/\\n//g' \
            -e 's/-----BEGIN[A-Za-z0-9 ]*-----//g' \
            -e 's/-----END[A-Za-z0-9 ]*-----//g' \
      | tr -dc 'A-Za-z0-9+/=')
    if [ -n "$RAW" ] && [ "$RAW" != "$CLEAN" ]; then
      awk -v k="$KEY_NAME" -v v="$CLEAN" 'index($0,k"=")==1{$0=k"="v}{print}' .env > .env.tmp \
        && mv .env.tmp .env
    fi
  done

  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # setup-2 prepare upload directory (container runs as uid 100:gid 101)
  MEDUSA_ROOT_PATH=${MEDUSA_ROOT_PATH}
  mkdir -p "$MEDUSA_ROOT_PATH/static"
  chown -R 100:101 "$MEDUSA_ROOT_PATH/static"

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
