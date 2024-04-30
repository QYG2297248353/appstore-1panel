#!/bin/bash

if [ -f .env ]; then
  source .env

  # 卸载容器名称以 immich- 开头的容器
  docker ps -a | grep immich- | awk '{print $1}' | xargs docker rm -f

  # 删除容器名称以 immich- 开头的镜像
  docker images | grep immich- | awk '{print $3}' | xargs docker rmi -f

  # 删除 immich- 开头的网络
  docker network ls | grep immich- | awk '{print $1}' | xargs docker network rm

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
