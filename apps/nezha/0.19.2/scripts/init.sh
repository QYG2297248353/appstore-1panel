#!/bin/bash

if [[ -f .env ]]; then
  source .env

  mkdir -p $NEZHA_ROOT_PATH
  mkdir -p $NEZHA_ROOT_PATH/data

  cp -f ./data/config-example.yaml ./data/nezha-config.yaml
  sed -i "s/grpcport: nz_grpc_port/grpcport: $PANEL_APP_PORT_GRPC/g" ./data/nezha-config.yaml
  sed -i "s/type: \"nz_oauth2_type\"/type: \"$OAUTH2_TYPE\"/g" ./data/nezha-config.yaml
  sed -i "s/admin: \"nz_admin_logins\"/admin: \"$OAUTH2_ADMIN\"/g" ./data/nezha-config.yaml
  sed -i "s/clientid: \"nz_github_oauth_client_id\"/clientid: \"$OAUTH2_CLIENTID\"/g" ./data/nezha-config.yaml
  sed -i "s/clientsecret: \"nz_github_oauth_client_secret\"/clientsecret: \"$OAUTH2_CLIENTSECRET\"/g" ./data/nezha-config.yaml
  sed -i "s/endpoint: \"\"/endpoint: \"$OAUTH2_ENDPOINT\"/g" ./data/nezha-config.yaml
  sed -i "s/brand: \"nz_site_title\"/brand: \"$NZ_SITE_TITLE\"/g" ./data/nezha-config.yaml
  sed -i "s/cookiename: \"nezha-dashboard\"/cookiename: \"$NZ_COOKIE_NAME\"/g" ./data/nezha-config.yaml
  sed -i "s/theme: \"default\"/theme: \"$NZ_THEME\"/g" ./data/nezha-config.yaml
  cp -f ./data/nezha-config.yaml $NEZHA_ROOT_PATH/data/config.yaml
  chmod -R 777 $NEZHA_ROOT_PATH

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
