#!/bin/bash

# 检查 .env 文件是否存在
if [ -f .env ]; then
  # 导入 .env 文件中的变量
  source .env

  # 替换 docker-compose.yml 中的网络变量
  sed -i "s/\${DOCKER_NET}/$CLUSTER_NETWORK/" docker-compose.yml

  # 创建目录
  mkdir -p "$ES_ROOT_PATH"

  mkdir -p "$ES_ROOT_PATH/certs"

  mkdir -p "$ES_ROOT_PATH/es01/data"

  mkdir -p "$ES_ROOT_PATH/es01/logs"

  mkdir -p "$ES_ROOT_PATH/es01/config"

  mkdir -p "$ES_ROOT_PATH/es01/plugins"

  mkdir -p "$ES_ROOT_PATH/kibana/data"
  mkdir -p "$ES_ROOT_PATH/kibana/config"

  # 生成 elasticsearch.yml 文件
  elasticsearch_config="cluster.name: \"$CLUSTER_NAME\"\nnetwork.host: 0.0.0.0"
  echo -e "$elasticsearch_config" > elasticsearch.yml
  cp elasticsearch.yml "$ES_ROOT_PATH/es01/config/elasticsearch.yml"

  # 生成 kibana.yml 文件
  kibana_config="server.host: \"0.0.0.0\"\nserver.shutdownTimeout: \"5s\"\nelasticsearch.hosts: [ \"http://localhost:$PANEL_APP_PORT_HTTPS\" ]\nmonitoring.ui.container.elasticsearch.enabled: true"
  echo -e "$kibana_config" > kibana.yml
  cp kibana.yml "$ES_ROOT_PATH/kibana/config/kibana.yml"

  # 清理中间文件
  rm elasticsearch.yml kibana.yml

  # 设置权限
  chmod -R 777 "$ES_ROOT_PATH"

  # 创建网络
  docker network create "$CLUSTER_NETWORK"
  # 检查创建是否成功
  if [ $? -eq 0 ]; then
      echo "Network $CLUSTER_NETWORK created successfully."
  else
      echo "Failed to create network $CLUSTER_NETWORK."
  fi

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
  exit 1
fi
