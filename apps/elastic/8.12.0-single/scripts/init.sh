#!/bin/bash

# 检查 .env 文件是否存在
if [ -f .env ]; then
  # 导入 .env 文件中的变量
  source .env

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
  kibana_config="server.host: \"0.0.0.0\"\nserver.shutdownTimeout: \"5s\"\nelasticsearch.hosts: [ \"https://es01:9200\" ]\nmonitoring.ui.container.elasticsearch.enabled: true"
  echo -e "$kibana_config" > kibana.yml
  cp kibana.yml "$ES_ROOT_PATH/kibana/config/kibana.yml"

  # 清理中间文件
  rm elasticsearch.yml kibana.yml

  # 设置权限
  chmod -R 777 "$ES_ROOT_PATH"

  echo "Directories and permissions set successfully."

else
  echo "Error: .env file not found."
  exit 1
fi
