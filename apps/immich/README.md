# Immich

Immich - 高性能自托管照片和视频备份解决方案

## 环境准备

### Redis 服务

Immich 使用 Redis 作为缓存服务，所以需要安装 Redis 服务。

## 版本说明

版本 `1.103.1` 为源维护的最终版，`1.103.1-dev` 将改动部署方式，存在大量环境变量的修改(不影响数据)，需要卸载重新安装应用！

## 指标监控

由于为了支持 `指标监控` 服务，为此增设两个新增端口映射 `8081` 和 `8082`，如果您不需要指标监控，将其修改为任意其他端口即可。

## 模型仓库

可用于 Immich 智能搜索的多模式模型。

### CLIP

对英语支持最好，对其他语言支持较差。
[immich-app's Collections - CLIP](https://huggingface.co/collections/immich-app/clip-654eaefb077425890874cd07)

### Multilingual CLIP

对多种语言支持较好。
[immich-app's Collections - Multilingual CLIP](https://huggingface.co/collections/immich-app/multilingual-clip-654eb08c2382f591eeb8c2a7)

## 常见问题

+ 安装缓慢
  由于Immich官方镜像为 `ghcr.io` 仓库，国内访问速度较慢，建议使用代理或者自行构建镜像。

+ 升级失败
    + 由于使用编排方式部署，不符合 1Panel 管理方式，因此无法通过 1Panel 管理升级，只能通过重新安装的方式升级。
      建议卸载后重新安装。卸载前请记录安装参数，以便重新安装。数据目录请勿删除，以免数据丢失。
