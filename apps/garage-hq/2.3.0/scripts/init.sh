#!/bin/bash

if [ -f .env ]; then
  source .env

  # setup-1 add default values
  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  # 检查 GARAGE_ROOT_PATH 是否存在
  if [ -z "${GARAGE_ROOT_PATH}" ]; then
    echo "Error: GARAGE_ROOT_PATH is not set in .env."
    exit 1
  fi

  # 创建 config 目录
  CONFIG_DIR="${GARAGE_ROOT_PATH}/config"
  mkdir -p "${CONFIG_DIR}"
  CONFIG_FILE="${CONFIG_DIR}/garage.toml"

  # 检查文件是否存在并包含 admin_token
  if [ -f "${CONFIG_FILE}" ] && grep -q '^admin_token' "${CONFIG_FILE}"; then
    echo "garage.toml already exists and contains admin_token. Skipping creation."
  else
    echo "Creating or updating garage.toml..."

    cat > "${CONFIG_FILE}" <<EOF
metadata_dir = "/tmp/meta"
data_dir = "/tmp/data"
db_engine = "sqlite"

replication_factor = 1

rpc_bind_addr = "[::]:3901"
rpc_public_addr = "127.0.0.1:3901"
rpc_secret = "$(openssl rand -hex 32)"

[s3_api]
s3_region = "garage"
api_bind_addr = "[::]:3900"
root_domain = ".s3.garage.localhost"

[s3_web]
bind_addr = "[::]:3902"
root_domain = ".web.garage.localhost"
index = "index.html"

[k2v_api]
api_bind_addr = "[::]:3904"

[admin]
api_bind_addr = "[::]:3903"
admin_token = "$(openssl rand -base64 32)"
metrics_token = "$(openssl rand -base64 32)"
EOF

    echo "garage.toml written to ${CONFIG_FILE}"
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
  exit 1
fi
