#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  mkdir -p $NEZHA_DASHBOARD_ROOT_PATH
  mkdir -p $NEZHA_DASHBOARD_ROOT_PATH/data

  cp ./data/config.yaml ./data/nezha-config.yaml
  sed -i "s/grpcport: nz_grpc_port/grpcport: $PANEL_APP_PORT_GRPC/g" ./data/nezha-config.yaml
  sed -i "s/type: \"nz_oauth2_type\"/type: \"$OAUTH2_TYPE\"/g" ./data/nezha-config.yaml
  sed -i "s/admin: \"nz_admin_logins\"/type: \"$OAUTH2_ADMIN\"/g" ./data/nezha-config.yaml
  sed -i "s/clientid: \"nz_github_oauth_client_id\"/type: \"$OAUTH2_CLIENTID\"/g" ./data/nezha-config.yaml
  sed -i "s/clientsecret: \"nz_github_oauth_client_secret\"/type: \"$OAUTH2_CLIENTSECRET\"/g" ./data/nezha-config.yaml
  sed -i "s/endpoint: \"\"/type: \"$OAUTH2_ENDPOINT\"/g" ./data/nezha-config.yaml
  sed -i "s/brand: \"nz_site_title\"/type: \"$NZ_SITE_TITLE\"/g" ./data/nezha-config.yaml
  sed -i "s/cookiename: \"nezha-dashboard\"/type: \"$NZ_COOKIE_NAME\"/g" ./data/nezha-config.yaml
  sed -i "s/theme: \"default\"/type: \"$NZ_THEME\"/g" ./data/nezha-config.yaml
  cp ./data/nezha-config.yaml $NEZHA_DASHBOARD_ROOT_PATH/data/config.yaml
  chmod -R 777 $NEZHA_DASHBOARD_ROOT_PATH

  echo "Check Finish."

else
  echo ".env not found."
fi
