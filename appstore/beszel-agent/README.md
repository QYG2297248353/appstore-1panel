# Beszel - 代理 (Agent)

轻量级的服务器监控平台，包含 Docker 统计信息、历史数据和警报功能

![Beszel](https://file.lifebus.top/imgs/beszel_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

### 轻量级

比主要解决方案更小，资源占用更少。

### 简单

易于设置，无需公网暴露。

### Docker 统计

跟踪每个容器的 CPU、内存和网络使用历史。

### 警报

可配置 CPU、内存、磁盘、带宽、温度和状态的警报。

### 多用户

用户管理自己的系统。管理员可以在用户之间共享系统。

### OAuth / OIDC

支持多种 OAuth2 提供程序。可以禁用密码验证。

### 自动备份

从磁盘或 S3 兼容的存储保存和恢复数据。

### REST API

在您自己的脚本和应用程序中使用或更新您的数据。

### 架构

Beszel 由两个主要组件组成：中心 (hub) 和 代理 (agent)。

+ 中心 (hub): 一个基于 PocketBase 构建的 Web 应用程序，提供用于查看和管理连接系统的仪表板。
+ 代理 (agent): 在您要监控的每个系统上运行，创建一个最小的 SSH 服务器以将系统指标传递到中心。

### 安装说明

#### 主机网络模式

代理必须使用主机网络模式才能访问网络接口指标，这将自动暴露端口。如果需要，可以使用环境变量更改端口。

#### 磁盘监控

您可以使用 Beszel 监控磁盘、分区或远程挂载。

> 使用 lsblk 命令查找分区的名称和挂载点。

在容器的 /extra-filesystems 目录中挂载目标文件系统中的文件夹。

```yml
services:
  beszel-agent:
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /<挂载点>/.beszel:/extra-filesystems/<挂载点>:ro
```

+ 挂载点: 挂载点的名称。
+ ro: 只读模式

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
