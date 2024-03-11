#!/bin/bash

if [[ -f ./.env ]]; then
  # 创建网络
  docker network create "$MICROSERVICES_NETWORK"
  # 检查创建是否成功
  if [ $? -eq 0 ]; then
      echo "Network $MICROSERVICES_NETWORK created successfully."
  else
      echo "Failed to create network $MICROSERVICES_NETWORK."
  fi
else
  echo ".env 文件不存在"
fi
