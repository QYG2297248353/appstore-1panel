# KSpeeder

Docker镜像加速专家 多镜像并发下载，动态负载均衡，断点续传支持，Docker镜像代理服务

![KSpeeder](https://file.lifebus.top/imgs/kspeeder_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Docker KSpeeder 是一个基于 Alpine Linux 的 KSpeeder 容器化部署方案。KSpeeder 是一个用于优化 Docker
镜像仓库访问的工具，它提供了智能镜像源选择、下载加速、状态监控等功能。本项目提供了多架构支持，可以在不同的硬件平台上运行。

## 软件特性

### Docker 镜像仓库代理服务

+ 支持 HTTPS 协议
+ 自动配置 Docker 镜像源
+ 支持证书自动获取和缓存
+ 支持多架构（AMD64/ARM64/ARM）
+ 智能镜像源选择和自动切换
+ 实时下载速度监控
+ 可视化状态监控界面

### 限速文件服务器

+ 支持可配置的带宽限制
+ 基于目录的文件服务
+ HTTP 协议支持

### 网络优化

+ 支持 HTTP/2 协议
+ 支持自定义超时设置
+ 内置连接池管理
+ 异步读取优化

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
